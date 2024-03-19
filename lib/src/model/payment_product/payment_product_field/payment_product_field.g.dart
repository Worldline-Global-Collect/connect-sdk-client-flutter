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

part of 'payment_product_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProductField _$PaymentProductFieldFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'type'],
  );
  return PaymentProductField(
    json['id'] as String,
    $enumDecode(_$PaymentProductFieldTypeEnumMap, json['type']),
    json['displayHints'] == null
        ? null
        : PaymentProductFieldDisplayHints.fromJson(
            json['displayHints'] as Map<String, dynamic>),
    dataRestrictions: json['dataRestrictions'] == null
        ? const DataRestrictions.empty()
        : DataRestrictions.fromJson(
            json['dataRestrictions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentProductFieldToJson(
        PaymentProductField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PaymentProductFieldTypeEnumMap[instance.type]!,
      'displayHints': instance.displayHints?.toJson(),
      'dataRestrictions': instance.dataRestrictions.toJson(),
    };

const _$PaymentProductFieldTypeEnumMap = {
  PaymentProductFieldType.string: 'string',
  PaymentProductFieldType.integer: 'integer',
  PaymentProductFieldType.numericString: 'numericstring',
  PaymentProductFieldType.expiryDate: 'expirydate',
  PaymentProductFieldType.boolean: 'boolean',
  PaymentProductFieldType.date: 'date',
};
