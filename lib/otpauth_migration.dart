/// Provides encode and decode functions for the otpauth-migration URI format used to import into and export 2FA secrets from the Google Authenticator app
library otpauth_migration;

import 'dart:convert';
import 'dart:typed_data';
import 'package:base32/base32.dart';

import 'generated/GoogleAuthenticatorImport.pb.dart';

/// A stateless class (not a singleton) that provides encode and decode functions for the otpauth-migration URI format used to import into and export 2FA secrets from the Google Authenticator app
class OtpAuthMigration {
  static const uriScheme = 'otpauth-migration';
  static const uriHost = 'offline';

  /// encode given list of optauth URIs into a single otpauth-migration URI
  String encode(List<String> otpAuths,
      {bool debug = false,
      int version = -1,
      int batchSize = -1,
      int batchIndex = -1,
      int batchId = -1}) {
    var gai = GoogleAuthenticatorImport();
    for (var otp in otpAuths) {
      var uri = Uri.parse(otp);
      //uri.queryParameters.forEach((k, v) {
      //  print('key: $k - value: $v');
      //  });
      var gaip = GoogleAuthenticatorImport_OtpParameters();
      gaip.name = Uri.decodeFull(uri.path.substring(1));
      //print("name = ${gaip.name}");
      try {
        gaip.secret = base32.decode(uri.queryParameters['secret'] ?? '');
      } catch (e) {
        return "";
      }
      //print("issuer = ${uri.queryParameters['issuer']}");
      var issuer = uri.queryParameters['issuer'];
      if (issuer != null && issuer != "") {
        gaip.issuer = issuer;
      }
      gaip.type = GoogleAuthenticatorImport_OtpType.OTP_TYPE_TOTP;
      gaip.algorithm = GoogleAuthenticatorImport_Algorithm.ALGORITHM_SHA1;
      gaip.digits = GoogleAuthenticatorImport_DigitCount.DIGIT_COUNT_SIX;
      gai.otpParameters.add(gaip);
      if (debug) print(gaip);
    }
    if (version >= 0) gai.version = version;
    if (batchSize >= 0) gai.batchSize = batchSize;
    if (batchIndex >= 0) gai.batchIndex = batchIndex;
    if (batchId >= 0) gai.batchId = batchId;
    final bytes = gai.writeToBuffer();
    return Uri(
      scheme: uriScheme,
      host: uriHost,
      queryParameters: {
        'data': base64.encode(bytes),
      },
    ).toString();
  }

  int batchSize(String value) {
    var decoded = _extractDataFromUri(value);
    if (decoded == null) {
      return 0;
    }

    try {
      final gai = GoogleAuthenticatorImport.fromBuffer(decoded);
      return gai.batchSize;
    } catch (e) {
      return -1;
    }
  }

  int batchIndex(String value) {
    var decoded = _extractDataFromUri(value);
    if (decoded == null) {
      return 0;
    }

    try {
      final gai = GoogleAuthenticatorImport.fromBuffer(decoded);
      return gai.batchIndex;
    } catch (e) {
      return -1;
    }
  }

  Uint8List? _extractDataFromUri(String value) {
    final uri = Uri.parse(value);
    if (uri.scheme != uriScheme || uri.host != uriHost) {
      throw ArgumentError(
          'Expected $uriScheme://$uriHost but got ${uri.scheme}:///${uri.host}');
    }
    final data = uri.queryParameters['data'];
    if (data == null || data.isEmpty) {
      return null;
    }
    return base64.decode(data);
  }

  /// decode a given otpauth-migration URI into a list of one or more otpauth URIs
  List<String> decode(String value, {bool debug = false}) {
    // check prefix "otpauth-migration://offline?data="
    // extract suffix - Base64 encode
    List<String> results = [];

    var decoded = _extractDataFromUri(value);
    if (decoded == null) {
      return [];
    }

    try {
      final gai = GoogleAuthenticatorImport.fromBuffer(decoded);

      if (debug) print(gai);

      //print(gai.otpParameters.length);
      for (var param in gai.otpParameters) {
        //print(param);
        // base32
        final base32String = base32.encode(param.secret as Uint8List);
        // var base32String = _decodeBase32(param.secret);
        //print("otpauth://totp/${param.name}?secret=${base32}");
        final name = Uri.encodeFull(param.name);
        final issuer = Uri.encodeComponent(param.issuer);
        String algorithm = "";
        switch (param.algorithm) {
          case GoogleAuthenticatorImport_Algorithm.ALGORITHM_SHA1:
            algorithm = "&algorithm=SHA1";
            break;
          case GoogleAuthenticatorImport_Algorithm.ALGORITHM_SHA256:
            algorithm = "&algorithm=SHA256";
            break;
          case GoogleAuthenticatorImport_Algorithm.ALGORITHM_SHA512:
            algorithm = "&algorithm=SHA512";
            break;
          case GoogleAuthenticatorImport_Algorithm.ALGORITHM_MD5:
            algorithm = "&algorithm=MD5";
            break;
          default:
            algorithm = "";
            break;
        }
        String digits = "";
        switch (param.digits) {
          case GoogleAuthenticatorImport_DigitCount.DIGIT_COUNT_SIX:
            digits = "&digits=6";
            break;
          case GoogleAuthenticatorImport_DigitCount.DIGIT_COUNT_EIGHT:
            digits = "&digits=8";
            break;
          default:
            digits = "";
            break;
        }
        results.add(
            "otpauth://totp/$name?secret=$base32String&issuer=$issuer$algorithm$digits&period=30");
      }

      //print("good");
      return results;
    } catch (e, stackTrace) {
      if (debug) {
        print('Error $e: $stackTrace');
      }
      return results;
    }
  }
}
