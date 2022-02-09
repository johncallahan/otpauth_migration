///
//  Generated code. Do not modify.
//  source: GoogleAuthenticatorImport.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'GoogleAuthenticatorImport.pbenum.dart';

export 'GoogleAuthenticatorImport.pbenum.dart';

class GoogleAuthenticatorImport_OtpParameters extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GoogleAuthenticatorImport.OtpParameters', package: const $pb.PackageName('KeePassOTP'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'secret', $pb.PbFieldType.OY)
    ..aOS(2, 'name')
    ..aOS(3, 'issuer')
    ..e<GoogleAuthenticatorImport_Algorithm>(4, 'algorithm', $pb.PbFieldType.OE, defaultOrMaker: GoogleAuthenticatorImport_Algorithm.ALGORITHM_UNSPECIFIED, valueOf: GoogleAuthenticatorImport_Algorithm.valueOf, enumValues: GoogleAuthenticatorImport_Algorithm.values)
    ..e<GoogleAuthenticatorImport_DigitCount>(5, 'digits', $pb.PbFieldType.OE, defaultOrMaker: GoogleAuthenticatorImport_DigitCount.DIGIT_COUNT_UNSPECIFIED, valueOf: GoogleAuthenticatorImport_DigitCount.valueOf, enumValues: GoogleAuthenticatorImport_DigitCount.values)
    ..e<GoogleAuthenticatorImport_OtpType>(6, 'type', $pb.PbFieldType.OE, defaultOrMaker: GoogleAuthenticatorImport_OtpType.OTP_TYPE_UNSPECIFIED, valueOf: GoogleAuthenticatorImport_OtpType.valueOf, enumValues: GoogleAuthenticatorImport_OtpType.values)
    ..aInt64(7, 'counter')
    ..hasRequiredFields = false
  ;

  GoogleAuthenticatorImport_OtpParameters._() : super();
  factory GoogleAuthenticatorImport_OtpParameters() => create();
  factory GoogleAuthenticatorImport_OtpParameters.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GoogleAuthenticatorImport_OtpParameters.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GoogleAuthenticatorImport_OtpParameters clone() => GoogleAuthenticatorImport_OtpParameters()..mergeFromMessage(this);
  GoogleAuthenticatorImport_OtpParameters copyWith(void Function(GoogleAuthenticatorImport_OtpParameters) updates) => super.copyWith((message) => updates(message as GoogleAuthenticatorImport_OtpParameters));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GoogleAuthenticatorImport_OtpParameters create() => GoogleAuthenticatorImport_OtpParameters._();
  GoogleAuthenticatorImport_OtpParameters createEmptyInstance() => create();
  static $pb.PbList<GoogleAuthenticatorImport_OtpParameters> createRepeated() => $pb.PbList<GoogleAuthenticatorImport_OtpParameters>();
  @$core.pragma('dart2js:noInline')
  static GoogleAuthenticatorImport_OtpParameters getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GoogleAuthenticatorImport_OtpParameters>(create);
  static GoogleAuthenticatorImport_OtpParameters _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get secret => $_getN(0);
  @$pb.TagNumber(1)
  set secret($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecret() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecret() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuer => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIssuer() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuer() => clearField(3);

  @$pb.TagNumber(4)
  GoogleAuthenticatorImport_Algorithm get algorithm => $_getN(3);
  @$pb.TagNumber(4)
  set algorithm(GoogleAuthenticatorImport_Algorithm v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlgorithm() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlgorithm() => clearField(4);

  @$pb.TagNumber(5)
  GoogleAuthenticatorImport_DigitCount get digits => $_getN(4);
  @$pb.TagNumber(5)
  set digits(GoogleAuthenticatorImport_DigitCount v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDigits() => $_has(4);
  @$pb.TagNumber(5)
  void clearDigits() => clearField(5);

  @$pb.TagNumber(6)
  GoogleAuthenticatorImport_OtpType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(GoogleAuthenticatorImport_OtpType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get counter => $_getI64(6);
  @$pb.TagNumber(7)
  set counter($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCounter() => $_has(6);
  @$pb.TagNumber(7)
  void clearCounter() => clearField(7);
}

class GoogleAuthenticatorImport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GoogleAuthenticatorImport', package: const $pb.PackageName('KeePassOTP'), createEmptyInstance: create)
    ..pc<GoogleAuthenticatorImport_OtpParameters>(1, 'otpParameters', $pb.PbFieldType.PM, subBuilder: GoogleAuthenticatorImport_OtpParameters.create)
    ..a<$core.int>(2, 'version', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'batchSize', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'batchIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(5, 'batchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GoogleAuthenticatorImport._() : super();
  factory GoogleAuthenticatorImport() => create();
  factory GoogleAuthenticatorImport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GoogleAuthenticatorImport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GoogleAuthenticatorImport clone() => GoogleAuthenticatorImport()..mergeFromMessage(this);
  GoogleAuthenticatorImport copyWith(void Function(GoogleAuthenticatorImport) updates) => super.copyWith((message) => updates(message as GoogleAuthenticatorImport));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GoogleAuthenticatorImport create() => GoogleAuthenticatorImport._();
  GoogleAuthenticatorImport createEmptyInstance() => create();
  static $pb.PbList<GoogleAuthenticatorImport> createRepeated() => $pb.PbList<GoogleAuthenticatorImport>();
  @$core.pragma('dart2js:noInline')
  static GoogleAuthenticatorImport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GoogleAuthenticatorImport>(create);
  static GoogleAuthenticatorImport _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GoogleAuthenticatorImport_OtpParameters> get otpParameters => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get batchSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set batchSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatchSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get batchIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set batchIndex($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBatchIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearBatchIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get batchId => $_getIZ(4);
  @$pb.TagNumber(5)
  set batchId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBatchId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatchId() => clearField(5);
}

