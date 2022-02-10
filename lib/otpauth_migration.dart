library otpauth_migration;

import 'dart:convert';
import 'dart:typed_data';
import 'package:base32/base32.dart';
import 'generated/GoogleAuthenticatorImport.pb.dart';

class OtpAuthMigration {

  List<String> rfc3548 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7"];

  String encode(List<String> otpauths) {
    var gai = GoogleAuthenticatorImport();
    otpauths.forEach((otp) {
      var uri = Uri.parse(otp);
      //uri.queryParameters.forEach((k, v) {
      //  print('key: $k - value: $v');
      //  });
      var gaip = GoogleAuthenticatorImport_OtpParameters();
      gaip.name = Uri.decodeFull(uri.path.substring(1));
      //print("name = ${gaip.name}");
      gaip.secret = _encodeBase32(uri.queryParameters['secret']);
      //print("issuer = ${uri.queryParameters['issuer']}");
      gaip.issuer = uri.queryParameters['issuer'];
      gaip.type = GoogleAuthenticatorImport_OtpType.OTP_TYPE_TOTP;
      gaip.algorithm = GoogleAuthenticatorImport_Algorithm.ALGORITHM_SHA1;
      gaip.digits = GoogleAuthenticatorImport_DigitCount.DIGIT_COUNT_SIX;
      gai.otpParameters.add(gaip);
      //print(gaip);
    });
    gai.version = 1;
    gai.batchSize = 1;
    gai.batchIndex = 0;
    gai.batchId = 790556775;
    final bytes = gai.writeToBuffer();
    return "otpauth-migration://offline?data=${base64.encode(bytes)}";
  }

  List<String> decode(String value) {
    // check prefix "otpauth-migration://offline?data="
    // extract suffix - Base64 encode
    List<String> results = [];

    RegExp exp = RegExp(r"otpauth-migration\:\/\/offline\?data=(.*)$");
    final match = exp.firstMatch(value);
    final encoded = match?.group(1);
    if(encoded != null) {
      var decoded = base64.decode(encoded);
      final gai = GoogleAuthenticatorImport.fromBuffer(decoded);

      //print(gai);

      int i = 0;
      //print(gai.otpParameters.length);
      gai.otpParameters.forEach((param) {
        //print(param);
        var base32 = _decodeBase32(param.secret);
        //print("otpauth://totp/${param.name}?secret=${base32}");
        final name = Uri.encodeFull(param.name);
        final issuer = Uri.encodeComponent(param.issuer);
        results.add("otpauth://totp/${name}?secret=${base32}&issuer=${issuer}");
      });

      //print("good");
      return results;
    } else {
      //print("bad");
      return [];
    }
  }

  List<int> _encodeBase32(String? s) {
    int i = 0;
    var j = 0;

    if(s != null) {
      Uint8List result = Uint8List((s.length * 5) ~/ 8);
      while(i < s.length) {
        // ZERO
        var c = s[i];
        var k = rfc3548.indexOf(c);
        //print(k);
        result[j] = k << 3;
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k >> 2);

        //print("---> ${result[j]}");
        j++;

        // ONE
        result[j] = k << 6;
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k << 1);
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k >> 4);

        //print("---> ${result[j]}");
        j++;

        // TWO
        result[j] = k << 4;
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k >> 1);

        //print("---> ${result[j]}");
        j++;

        // THREE
        result[j] = k << 7;
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k << 2);
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | (k >> 3);

        //print("---> ${result[j]}");
        j++;

        // FOUR
        result[j] = k << 5;
        i++;

        c = s[i];
        k = rfc3548.indexOf(c);
        //print(k);
        result[j] = result[j] | k;
        i++;

        //print("---> ${result[j]}");
        j++;
      }
      //print(result);
      return result;
    }
    return Uint8List(0);
  }

  String _decodeBase32(List<int> s) {
    //print(s);
    Uint8List ulist = s as Uint8List;
    String result = "";

    var i = 0;
    while(i < ulist.length) {
      var q0 = ulist[i] & 0xF8;
      q0 = q0 >> 3;
      //print(rfc3548[q0]);
      result += rfc3548[q0];

      var q1 = ulist[i++] & 0x07;
      q1 = q1 << 2;
      var temp = ulist[i] & 0xC0;
      temp = temp >> 6;
      q1 = q1 + temp;
      //print(rfc3548[q1]);
      result += rfc3548[q1];

      var q2 = ulist[i] & 0x3E;
      q2 = q2 >> 1;
      //print(rfc3548[q2]);
      result += rfc3548[q2];

      var q3 = ulist[i++] & 0x01;
      q3 = q3 << 4;
      temp = ulist[i] & 0xF0;
      temp = temp >> 4;
      q3 = q3 + temp;
      //print(rfc3548[q3]);
      result += rfc3548[q3];

      var q4 = ulist[i++] & 0x0F;
      q4 = q4 << 1;
      temp = ulist[i] & 0x80;
      temp = temp >> 7;
      q4 = q4 + temp;
      //print(rfc3548[q4]);
      result += rfc3548[q4];

      var q5 = ulist[i] & 0x7c;
      q5 = q5 >> 2;
      //print(rfc3548[q5]);
      result += rfc3548[q5];

      var q6 = ulist[i++] & 0x03;
      q6 = q6 << 3;
      temp = ulist[i] & 0xE0;
      temp = temp >> 5;
      q6 = q6 + temp;
      //print(rfc3548[q6]);
      result += rfc3548[q6];

      var q7 = ulist[i++] & 0x1F;
      //print(rfc3548[q7]);
      result += rfc3548[q7];

    }

    //print(result);
    return result;
  }

}
