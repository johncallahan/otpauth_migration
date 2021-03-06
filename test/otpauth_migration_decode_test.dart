// @dart=2.9
import 'package:test/test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

import './otpauth_migration_test_data.dart';

void main() {
  test('test parsing', () {
    final otpAuthParser = OtpAuthMigration();

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string1"),
        list1);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string2"),
        list2);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string3"),
        list3);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string4"),
        list4);

    expect(
        otpAuthParser.decode(
            "otpauth-migration://offline?data=$string5"),
        list5);

  });
}
