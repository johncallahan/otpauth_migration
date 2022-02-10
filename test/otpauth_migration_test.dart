// @dart=2.9
import 'package:flutter_test/flutter_test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

void main() {
  test('test parsing', () {
    final otp_auth_parser = OtpAuthMigration();

    expect(otp_auth_parser.parse("otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAhABGAEgACjn4Pv4Ag=="),
        ["otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.parse("otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAg=="),
        ["otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.parse("otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC"),
        ["otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.parse("otpauth-migration://offline?data=CiMKCskCjMDVZlPV3OQSD015IFRlc3QgQWNjb3VudCABKAEwAhAB"),
        ["otpauth://totp/My%20Test%20Account?secret=ZEBIZQGVMZJ5LXHE&issuer="]);

    expect(otp_auth_parser.parse("otpauth-MIGRATION://offline?data=CiMKCskCjMDVZlPV3OQSD015IFRlc3QgQWNjb3VudCABKAEwAhAB"),
        []);

    //expect(otp_auth_parser.build(["otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]),
    //    "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC");

    expect(otp_auth_parser.build([
        "otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME+Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]),
      "otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAhABGAEgACjn4Pv4Ag==");
  });
}
