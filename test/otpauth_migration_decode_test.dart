import 'package:test/test.dart';

import 'package:otpauth_migration/otpauth_migration.dart';

import './otpauth_migration_test_data.dart';

void main() {
  test('test parsing', () {
    final otpAuthParser = OtpAuthMigration();

    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string1"),
        list1);

    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string2"),
        list2);

    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string3"),
        list3);

    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string4"),
        list4);

    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string5"),
        list5);

    expect(
        otpAuthParser
            .batchSize("otpauth-migration://offline?data=$string_1_of_3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string_1_of_3"),
        0);
    expect(
        otpAuthParser.decode("otpauth-migration://offline?data=$string_1_of_3"),
        list_1_of_3);

    expect(otpAuthParser.batchSize(string_1_of_3_urlencoded), 3);
    expect(otpAuthParser.batchIndex(string_1_of_3_urlencoded), 0);
    expect(otpAuthParser.decode(string_1_of_3_urlencoded), list_1_of_3);

    expect(
        otpAuthParser
            .batchSize("otpauth-migration://offline?data=$string_2_of_3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string_2_of_3"),
        1);
    expect(
        otpAuthParser.decode("otpauth-migration://offline?data=$string_2_of_3"),
        list_2_of_3);

    expect(otpAuthParser.batchSize(string_2_of_3_urlencoded), 3);
    expect(otpAuthParser.batchIndex(string_2_of_3_urlencoded), 1);
    expect(otpAuthParser.decode(string_2_of_3_urlencoded), list_2_of_3);

    expect(
        otpAuthParser
            .batchSize("otpauth-migration://offline?data=$string_3_of_3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string_3_of_3"),
        2);
    expect(
        otpAuthParser.decode("otpauth-migration://offline?data=$string_3_of_3"),
        list_3_of_3);

    expect(otpAuthParser.batchSize(string_3_of_3_urlencoded), 3);
    expect(otpAuthParser.batchIndex(string_3_of_3_urlencoded), 2);
    expect(otpAuthParser.decode(string_3_of_3_urlencoded), list_3_of_3);
  });
  test('test google authenticator export', () {
    final otpAuthParser = OtpAuthMigration();
    expect(
        otpAuthParser.decode(
            'otpauth-migration://offline?data=ChcKCRyKCQygkMoJFBIEdGVzdCABKAEwAhABGAEgACiTqI3MBw%3D%3D',
            debug: true),
        [
          'otpauth://totp/test?secret=DSFASDFASDFASFA=&issuer=&algorithm=SHA1&digits=6&period=30',
        ]);
  });
}
