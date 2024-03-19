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

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../model/models.dart';

part 'native_exception.g.dart';

/// Contains information about a native SDK error if it occurred while executing API calls.
@JsonSerializable(explicitToJson: true, includeIfNull: true)
class NativeException {
  /// Error details.
  @JsonKey()
  String error = "";

  /// Holds additional information regarding the exception if this was created from a [Throwable] returned by the native SDK.
  @JsonKey()
  Throwable? throwable;

  NativeException({this.error = "", this.throwable});

  factory NativeException.fromApiErrorResponse(ApiErrorResponse apiError) =>
      NativeException(error: apiError.errors.join(",\n"), throwable: null);

  static NativeException fromThrowable(Throwable? throwable) {
    return NativeException(
        error:
            "Native exception in the Connect SDK.\nMessage: ${throwable?.message ?? ""}.\nThrowable: ${jsonEncode(throwable?.throwable?.toJson())}",
        throwable: throwable);
  }

  factory NativeException.fromJson(Map<String, dynamic> json) =>
      _$NativeExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$NativeExceptionToJson(this);
}
