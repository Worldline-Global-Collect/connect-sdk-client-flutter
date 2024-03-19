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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_sdk_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeSdkResult<T> _$NativeSdkResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NativeSdkResult<T>(
      _$nullableGenericFromJson(json['data'], fromJsonT),
      json['error'] == null
          ? null
          : ApiErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
      json['throwable'] == null
          ? null
          : Throwable.fromJson(json['throwable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NativeSdkResultToJson<T>(
  NativeSdkResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'error': instance.error?.toJson(),
      'throwable': instance.throwable?.toJson(),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
