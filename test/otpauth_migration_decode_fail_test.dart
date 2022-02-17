// @dart=2.9
import 'package:test/test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

import './otpauth_migration_test_data.dart';

void main() {
  test('test parsing', () {
    final otpAuthParser = OtpAuthMigration();

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline"),
        []);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data="),
        []);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string1"),
        []);

    expect(
        otpAuthParser.decode(
            "otpauth-MIGRATION://offline?data=$string2"),
        []);

    expect(
        otpAuthParser.decode(
            string3),
        []);

    });
}
