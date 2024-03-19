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

part of 'tooltip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tooltip _$TooltipFromJson(Map<String, dynamic> json) => Tooltip(
      json['image'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$TooltipToJson(Tooltip instance) => <String, dynamic>{
      'label': instance.label,
      'image': instance.imageUrl,
    };
