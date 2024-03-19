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

part of 'account_on_file_display_hints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountOnFileDisplayHints _$AccountOnFileDisplayHintsFromJson(
        Map<String, dynamic> json) =>
    AccountOnFileDisplayHints(
      (json['labelTemplate'] as List<dynamic>)
          .map((e) => LabelTemplateElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['logo'] as String,
    );

Map<String, dynamic> _$AccountOnFileDisplayHintsToJson(
        AccountOnFileDisplayHints instance) =>
    <String, dynamic>{
      'labelTemplate': instance.labelTemplate.map((e) => e.toJson()).toList(),
      'logo': instance.logo,
    };
