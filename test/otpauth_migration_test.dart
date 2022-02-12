// @dart=2.9
import 'package:flutter_test/flutter_test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

void main() {
  test('test parsing', () {
    final otp_auth_parser = OtpAuthMigration();

    expect(otp_auth_parser.decode("otpauth-migration://offline?data=Cj8KFGnEpnTMQ7KDguNWnddyGyCbSVLaEhhBQ01FIENvOmpvaG5AZXhhbXBsZS5jb20aB0FDTUUgQ28gASgBMAIKRAoUXkj+5MY2arwKjsnH2aDsbm6TAlYSG0JldGEgTHRkLjpob21lckBleGFtcGxlLmNvbRoJQmV0YSBMdGQuIAEoATACCkgKFDDFyzUNPgYoI3q/KGHBdcNU9ptWEh1DYXRzICYgRG9nczptYXJnZUBleGFtcGxlLmNvbRoLQ2F0cyAmIERvZ3MgASgBMAIKSAoUunHzbm5h/LUO0yilLMI+dYZY1eISHURhaWx5IEJ1Z2xlOnBldGVyQGV4YW1wbGUuY29tGgtEYWlseSBCdWdsZSABKAEwAhABGAEgACjDnb+uAg=="),
          ['otpauth://totp/ACME%20Co:john@example.com?secret=NHCKM5GMIOZIHAXDK2O5O4Q3ECNUSUW2&issuer=ACME%20Co',
              'otpauth://totp/Beta%20Ltd.:homer@example.com?secret=LZEP5ZGGGZVLYCUOZHD5TIHMNZXJGASW&issuer=Beta%20Ltd.',
              'otpauth://totp/Cats%20&%20Dogs:marge@example.com?secret=GDC4WNINHYDCQI32X4UGDQLVYNKPNG2W&issuer=Cats%20%26%20Dogs',
              'otpauth://totp/Daily%20Bugle:peter@example.com?secret=XJY7G3TOMH6LKDWTFCSSZQR6OWDFRVPC&issuer=Daily%20Bugle']);

    expect(otp_auth_parser.decode("otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAhABGAEgACjn4Pv4Ag=="),
        ["otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.decode("otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAg=="),
        ["otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME%20Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.decode("otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC"),
        ["otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);

    expect(otp_auth_parser.decode("otpauth-migration://offline?data=CiMKCskCjMDVZlPV3OQSD015IFRlc3QgQWNjb3VudCABKAEwAhAB"),
        ["otpauth://totp/My%20Test%20Account?secret=ZEBIZQGVMZJ5LXHE&issuer="]);

    expect(otp_auth_parser.decode("otpauth-MIGRATION://offline?data=CiMKCskCjMDVZlPV3OQSD015IFRlc3QgQWNjb3VudCABKAEwAhAB"),
        []);

    //expect(otp_auth_parser.encode(["otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]),
    //    "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC");

    expect(otp_auth_parser.encode([
        "otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME+Co",
        "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]),
      "otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAhABGAEgACjn4Pv4Ag==");
  });
}
