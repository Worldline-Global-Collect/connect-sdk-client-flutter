/*
 *
 *  * Do not remove or alter the notices in this preamble.
 *  *
 *  * This software is owned by Worldline Global Collect and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *  *
 *  * Copyright © 2023 Worldline Global Collect and/or its affiliates.
 *  *
 *  * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *  *
 *  * Please contact Worldline Global Collect for questions regarding license and user rights.
 *
 */

import 'package:json_annotation/json_annotation.dart';

import '../../models.dart';

part 'native_sdk_result.g.dart';
part 'native_sdk_result_status.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class NativeSdkResult<T> {
  @JsonKey(required: false)
  T? data;

  @JsonKey(required: false)
  ApiErrorResponse? error;

  @JsonKey(required: false)
  Throwable? throwable;

  NativeSdkResult(this.data, this.error, this.throwable);

  factory NativeSdkResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$NativeSdkResultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$NativeSdkResultToJson(this, toJsonT);

  NativeSdkResultStatus status() {
    if (data != null && error == null) {
      return NativeSdkResultStatus.success;
    } else if (error != null) {
      return NativeSdkResultStatus.apiError;
    } else {
      // no data and no error
      return NativeSdkResultStatus.exception;
    }
  }
}
