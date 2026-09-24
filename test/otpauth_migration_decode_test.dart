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
        otpAuthParser.batchSize("otpauth-migration://offline?data=$string1Of3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string1Of3"),
        0);
    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string1Of3"),
        list1Of3);

    expect(otpAuthParser.batchSize(string1Of3UrlEncoded), 3);
    expect(otpAuthParser.batchIndex(string1Of3UrlEncoded), 0);
    expect(otpAuthParser.decode(string1Of3UrlEncoded), list1Of3);

    expect(
        otpAuthParser.batchSize("otpauth-migration://offline?data=$string2Of3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string2Of3"),
        1);
    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string2Of3"),
        list2Of3);

    expect(otpAuthParser.batchSize(string2Of3UrlEncoded), 3);
    expect(otpAuthParser.batchIndex(string2Of3UrlEncoded), 1);
    expect(otpAuthParser.decode(string2Of3UrlEncoded), list2Of3);

    expect(
        otpAuthParser.batchSize("otpauth-migration://offline?data=$string3Of3"),
        3);
    expect(
        otpAuthParser
            .batchIndex("otpauth-migration://offline?data=$string3Of3"),
        2);
    expect(otpAuthParser.decode("otpauth-migration://offline?data=$string3Of3"),
        list3Of3);

    expect(otpAuthParser.batchSize(string3Of3UrlEncoded), 3);
    expect(otpAuthParser.batchIndex(string3Of3UrlEncoded), 2);
    expect(otpAuthParser.decode(string3Of3UrlEncoded), list3Of3);
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
