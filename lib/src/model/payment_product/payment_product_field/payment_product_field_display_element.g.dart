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

part of 'payment_product_field_display_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProductFieldDisplayElement _$PaymentProductFieldDisplayElementFromJson(
        Map<String, dynamic> json) =>
    PaymentProductFieldDisplayElement(
      json['id'] as String,
      json['value'] as String,
      $enumDecode(_$PaymentProductFieldDisplayElementTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$PaymentProductFieldDisplayElementToJson(
        PaymentProductFieldDisplayElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'type': _$PaymentProductFieldDisplayElementTypeEnumMap[instance.type]!,
    };

const _$PaymentProductFieldDisplayElementTypeEnumMap = {
  PaymentProductFieldDisplayElementType.integer: 'INTEGER',
  PaymentProductFieldDisplayElementType.string: 'STRING',
  PaymentProductFieldDisplayElementType.currency: 'CURRENCY',
  PaymentProductFieldDisplayElementType.percentage: 'PERCENTAGE',
  PaymentProductFieldDisplayElementType.uri: 'URI',
};
