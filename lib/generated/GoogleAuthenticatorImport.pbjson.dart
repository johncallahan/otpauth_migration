///
//  Generated code. Do not modify.
//  source: GoogleAuthenticatorImport.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const GoogleAuthenticatorImport$json = const {
  '1': 'GoogleAuthenticatorImport',
  '2': const [
    const {'1': 'otp_parameters', '3': 1, '4': 3, '5': 11, '6': '.KeePassOTP.GoogleAuthenticatorImport.OtpParameters', '10': 'otpParameters'},
    const {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'batch_size', '3': 3, '4': 1, '5': 5, '10': 'batchSize'},
    const {'1': 'batch_index', '3': 4, '4': 1, '5': 5, '10': 'batchIndex'},
    const {'1': 'batch_id', '3': 5, '4': 1, '5': 5, '10': 'batchId'},
  ],
  '3': const [GoogleAuthenticatorImport_OtpParameters$json],
  '4': const [GoogleAuthenticatorImport_Algorithm$json, GoogleAuthenticatorImport_DigitCount$json, GoogleAuthenticatorImport_OtpType$json],
};

const GoogleAuthenticatorImport_OtpParameters$json = const {
  '1': 'OtpParameters',
  '2': const [
    const {'1': 'secret', '3': 1, '4': 1, '5': 12, '10': 'secret'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'issuer', '3': 3, '4': 1, '5': 9, '10': 'issuer'},
    const {'1': 'algorithm', '3': 4, '4': 1, '5': 14, '6': '.KeePassOTP.GoogleAuthenticatorImport.Algorithm', '10': 'algorithm'},
    const {'1': 'digits', '3': 5, '4': 1, '5': 14, '6': '.KeePassOTP.GoogleAuthenticatorImport.DigitCount', '10': 'digits'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.KeePassOTP.GoogleAuthenticatorImport.OtpType', '10': 'type'},
    const {'1': 'counter', '3': 7, '4': 1, '5': 3, '10': 'counter'},
  ],
};

const GoogleAuthenticatorImport_Algorithm$json = const {
  '1': 'Algorithm',
  '2': const [
    const {'1': 'ALGORITHM_UNSPECIFIED', '2': 0},
    const {'1': 'ALGORITHM_SHA1', '2': 1},
    const {'1': 'ALGORITHM_SHA256', '2': 2},
    const {'1': 'ALGORITHM_SHA512', '2': 3},
    const {'1': 'ALGORITHM_MD5', '2': 4},
  ],
};

const GoogleAuthenticatorImport_DigitCount$json = const {
  '1': 'DigitCount',
  '2': const [
    const {'1': 'DIGIT_COUNT_UNSPECIFIED', '2': 0},
    const {'1': 'DIGIT_COUNT_SIX', '2': 1},
    const {'1': 'DIGIT_COUNT_EIGHT', '2': 2},
  ],
};

const GoogleAuthenticatorImport_OtpType$json = const {
  '1': 'OtpType',
  '2': const [
    const {'1': 'OTP_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'OTP_TYPE_HOTP', '2': 1},
    const {'1': 'OTP_TYPE_TOTP', '2': 2},
  ],
};

