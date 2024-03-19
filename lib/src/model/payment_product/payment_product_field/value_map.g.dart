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

part of 'value_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueMap _$ValueMapFromJson(Map<String, dynamic> json) => ValueMap(
      json['value'] as String,
      (json['displayElements'] as List<dynamic>)
          .map((e) => PaymentProductFieldDisplayElement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ValueMapToJson(ValueMap instance) => <String, dynamic>{
      'value': instance.value,
      'displayElements': instance.displayElements,
    };
