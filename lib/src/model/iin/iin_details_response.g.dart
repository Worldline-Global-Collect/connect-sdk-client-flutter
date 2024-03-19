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

part of 'iin_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IinDetailsResponse _$IinDetailsResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['status'],
  );
  return IinDetailsResponse(
    $enumDecode(_$IinStatusEnumMap, json['status']),
    paymentProductId: json['paymentProductId'] as String?,
    countryCode: json['countryCode'] as String?,
    isAllowedInContext: json['isAllowedInContext'] as bool,
    coBrands: (json['coBrands'] as List<dynamic>?)
            ?.map((e) => IinDetail.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$IinDetailsResponseToJson(IinDetailsResponse instance) =>
    <String, dynamic>{
      'status': _$IinStatusEnumMap[instance.status]!,
      'paymentProductId': instance.paymentProductId,
      'countryCode': instance.countryCode,
      'isAllowedInContext': instance.isAllowedInContext,
      'coBrands': instance.coBrands.map((e) => e.toJson()).toList(),
    };

const _$IinStatusEnumMap = {
  IinStatus.supported: 'SUPPORTED',
  IinStatus.unknown: 'UNKNOWN',
  IinStatus.notEnoughDigits: 'NOT_ENOUGH_DIGITS',
  IinStatus.existingButNotAllowed: 'EXISTING_BUT_NOT_ALLOWED',
};
