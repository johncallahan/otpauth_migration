// @dart = 2.3
library example;

import 'package:otpauth_migration/otpauth_migration.dart';

void main() {
  final otp_auth_parser = OtpAuthMigration();
  List<String> uris = otp_auth_parser.decode("otpauth-migration://offline?data=Cj8KFGnEpnTMQ7KDguNWnddyGyCbSVLaEhhBQ01FIENvOmpvaG5AZXhhbXBsZS5jb20aB0FDTUUgQ28gASgBMAIKRAoUXkj+5MY2arwKjsnH2aDsbm6TAlYSG0JldGEgTHRkLjpob21lckBleGFtcGxlLmNvbRoJQmV0YSBMdGQuIAEoATACCkgKFDDFyzUNPgYoI3q/KGHBdcNU9ptWEh1DYXRzICYgRG9nczptYXJnZUBleGFtcGxlLmNvbRoLQ2F0cyAmIERvZ3MgASgBMAIKSAoUunHzbm5h/LUO0yilLMI+dYZY1eISHURhaWx5IEJ1Z2xlOnBldGVyQGV4YW1wbGUuY29tGgtEYWlseSBCdWdsZSABKAEwAhABGAEgACjDnb+uAg==");
  print(uris);
  String uri = otp_auth_parser.encode([
      "otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME+Co",
      "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);
  print(uri);
}
