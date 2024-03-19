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

part of 'directory_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryEntry _$DirectoryEntryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['issuerId', 'issuerList', 'issuerName'],
  );
  return DirectoryEntry(
    (json['countryNames'] as List<dynamic>).map((e) => e as String).toList(),
    json['issuerId'] as String,
    json['issuerList'] as String,
    json['issuerName'] as String,
  );
}

Map<String, dynamic> _$DirectoryEntryToJson(DirectoryEntry instance) =>
    <String, dynamic>{
      'countryNames': instance.countryNames,
      'issuerId': instance.issuerId,
      'issuerList': instance.issuerList,
      'issuerName': instance.issuerName,
    };
