library otpauth_migration;

import 'dart:convert';
import 'dart:typed_data';
import 'package:base32/base32.dart';
import 'generated/GoogleAuthenticatorImport.pb.dart';

class OtpAuthMigration {

  List<String> rfc3548 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7"];

  String build(List<String> otpauths) {
    var gai = GoogleAuthenticatorImport();
    otpauths.forEach((otp) {
      var gaip = GoogleAuthenticatorImport_OtpParameters();
      gaip.name = "Example:alice@google.com";
      gaip.secret = [72, 101, 108, 108, 111, 33, 222, 173, 190, 239];
      gaip.issuer = "Example";
      gaip.type = GoogleAuthenticatorImport_OtpType.OTP_TYPE_TOTP;
      gai.otpParameters.add(gaip);
    });
    final bytes = gai.writeToBuffer();
    return "otpauth-migration://offline?data=${base64.encode(bytes)}";
  }

  String _mock_build(List<String> otpauths) {
    var gai = GoogleAuthenticatorImport();
    otpauths.forEach((otp) {
      var gaip = GoogleAuthenticatorImport_OtpParameters();
      gaip.name = "Example:alice@google.com";
      gaip.secret = [72, 101, 108, 108, 111, 33, 222, 173, 190, 239];
      gaip.issuer = "Example";
      gaip.type = GoogleAuthenticatorImport_OtpType.OTP_TYPE_TOTP;
      gai.otpParameters.add(gaip);
    });
    final bytes = gai.writeToBuffer();
    return base64.encode(bytes);
  }


  List<String> parse(String value) {
    // check prefix "otpauth-migration://offline?data="
    // extract suffix - Base64 encode
    List<String> results = [];

    RegExp exp = RegExp(r"otpauth-migration\:\/\/offline\?data=(.*)$");
    final match = exp.firstMatch(value);
    final encoded = match?.group(1);
    if(encoded != null) {
      var decoded = base64.decode(encoded);
      final gai = GoogleAuthenticatorImport.fromBuffer(decoded);

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

  List<int> _encodeBase32(String s) {
    return [];
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
