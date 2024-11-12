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

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['code'],
  );
  return Error(
    json['code'] as String,
    (json['httpStatusCode'] as num?)?.toInt(),
    json['message'] as String?,
    category: json['category'] as String?,
    id: json['id'] as String?,
    propertyName: json['propertyName'] as String?,
    requestId: json['requestId'] as String?,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'category': instance.category,
      'code': instance.code,
      'httpStatusCode': instance.httpStatusCode,
      'id': instance.id,
      'message': instance.message,
      'propertyName': instance.propertyName,
      'requestId': instance.requestId,
    };
