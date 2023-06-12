// ignore_for_file: avoid_print
library example;

import 'package:otpauth_migration/otpauth_migration.dart';

void main() {
  final otpAuthParser = OtpAuthMigration();

  List<String> uris = otpAuthParser.decode(
      "otpauth-migration://offline?data=Cj8KFGnEpnTMQ7KDguNWnddyGyCbSVLaEhhBQ01FIENvOmpvaG5AZXhhbXBsZS5jb20aB0FDTUUgQ28gASgBMAIKRAoUXkj+5MY2arwKjsnH2aDsbm6TAlYSG0JldGEgTHRkLjpob21lckBleGFtcGxlLmNvbRoJQmV0YSBMdGQuIAEoATACCkgKFDDFyzUNPgYoI3q/KGHBdcNU9ptWEh1DYXRzICYgRG9nczptYXJnZUBleGFtcGxlLmNvbRoLQ2F0cyAmIERvZ3MgASgBMAIKSAoUunHzbm5h/LUO0yilLMI+dYZY1eISHURhaWx5IEJ1Z2xlOnBldGVyQGV4YW1wbGUuY29tGgtEYWlseSBCdWdsZSABKAEwAhABGAEgACjDnb+uAg==",
      debug: true);
  print(uris);

  print("*****************");

  List<String> moreURIs = otpAuthParser.decode(
      "otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC");
  print(moreURIs);

  print("*****************");

  String uri = otpAuthParser.encode([
    "otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME+Co",
    "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"
  ]);
  print(uri);
}
