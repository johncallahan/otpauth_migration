import 'package:test/test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

import './otpauth_migration_test_data.dart';

void main() {
  test('test parsing', () {
    final otpAuthParser = OtpAuthMigration();

    // secret is purposely truncated
    // using base32 package, it will be padded correctly,
    // hence it is encoded correctly.
    expect(otpAuthParser.encode(errorList3), errorString3);
  });
}
