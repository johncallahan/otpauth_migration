// @dart=2.9
import 'package:test/test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

import './otpauth_migration_test_data.dart';

void main() {
  test('test parsing', () {
    final otpAuthParser = OtpAuthMigration();

    expect(otpAuthParser.encode(list0),
        "otpauth-migration://offline?data=$string0");

    expect(
        otpAuthParser.encode(list1,
            version: 1, batchSize: 0, batchIndex: 0, batchId: 790556775),
        "otpauth-migration://offline?data=$string1");

    expect(otpAuthParser.encode(list2, version: 1),
        "otpauth-migration://offline?data=$string2");

    expect(
        otpAuthParser.encode(list3,
            version: 1, batchSize: 1, batchIndex: 0, batchId: 634375875),
        "otpauth-migration://offline?data=$string3");

    expect(
        otpAuthParser.encode(list4,
            version: 1, batchSize: 0, batchIndex: 0, batchId: 790556775),
        "otpauth-migration://offline?data=$string4");

    expect(
        otpAuthParser.encode(list5,
            version: 1, batchSize: 1, batchIndex: 0, batchId: 1765491099),
        "otpauth-migration://offline?data=$string5");
        
    expect(
        otpAuthParser.encode(list6,
            version: 1, batchSize: 1, batchIndex: 0, batchId: 1765491099),
        "otpauth-migration://offline?data=$string6");
  });
}
