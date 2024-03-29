[![Pub](https://img.shields.io/pub/v/otpauth_migration.svg)](https://pub.dev/packages/otpauth_migration)
[![Dart](https://github.com/johncallahan/otpauth_migration/actions/workflows/dart.yml/badge.svg)](https://github.com/johncallahan/otpauth_migration/actions/workflows/dart.yml)

A Dart package to encode and decode the otpauth-migration URI format used to import into and export 2FA secrets from the Google Authenticator app.

## Features

* OtpAuthMigration - main class (stateless)
* String OtpAuthMigration.encode(List\<String\> uris)
* List\<String\> OtpAuthMigration.decode(String uri)

## Requirements

* Dart 2.16.1

## Import

```dart
import 'package:otpauth_migration/otpauth_migration.dart';
```

## Usage

```dart
final otp_auth_parser = OtpAuthMigration();
var otp_uris = otp_auth_parser.decode("otpauth-migration://offline?data=CjEKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZTAC"));
// otp_uris = ["otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);
```

```dart
final otp_auth_parser
var otp_migration = otp_auth_parser.encode([
    "otpauth://totp/ACME%20Co:john.doe@example.com?secret=HXDMVJECJJWSRB3HWIZR4IFUGFTMXBOZ&issuer=ACME+Co",
    "otpauth://totp/Example:alice@google.com?secret=JBSWY3DPEHPK3PXP&issuer=Example"]);
// otp_migration =
  "otpauth-migration://offline?data=CkMKFD3GyqSCSm0oh2eyMx4gtDFmy4XZEhxBQ01FIENvOmpvaG4uZG9lQGV4YW1wbGUuY29tGgdBQ01FIENvIAEoATACCjUKCkhlbGxvId6tvu8SGEV4YW1wbGU6YWxpY2VAZ29vZ2xlLmNvbRoHRXhhbXBsZSABKAEwAhABGAEgACjn4Pv4Ag==");
```

See additional examples in the `/example` folder.

## Testing

```shell
% dart test
```

A github action (in .github/workflows/dart.yml) also runs the tests on main branch pushes and PRs

## Example

```shell
% cd example
% dart run otpauth_migration_example.dart
```

## Additional information

* ~~See otpauth_migration_example project~~
* Need more error checking inputs (and associated tests)
* ~~Fix version, batchSize, batchIndex, batchId~~
* Add options for type, algorithm, digits (each optParameter)
* ~~Add Github Actions badge (to show Github Action test results)~~
* RFC 3548 description (and diagram)
* Add support for a validation API (i.e., good or bad URI format)

## Build

```shell
% protoc -I=./proto --dart_out=lib/generated proto/GoogleAuthenticatorImport.proto
```

## API

```shell
% dart doc .
```

## Formatting and analysis

```shell
% dart analyze
% dart format .
```

## Publishing

```shell
% dart pub publish
```

## License

The MIT License (MIT)
Copyright © 2022 John R. Callahan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
