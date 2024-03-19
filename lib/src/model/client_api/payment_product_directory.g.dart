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

part of 'payment_product_directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProductDirectory _$PaymentProductDirectoryFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entries'],
  );
  return PaymentProductDirectory(
    (json['entries'] as List<dynamic>)
        .map((e) => DirectoryEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PaymentProductDirectoryToJson(
        PaymentProductDirectory instance) =>
    <String, dynamic>{
      'entries': instance.entries,
    };
