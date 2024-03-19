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

part of 'third_party_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdPartyStatusResponse _$ThirdPartyStatusResponseFromJson(
        Map<String, dynamic> json) =>
    ThirdPartyStatusResponse(
      $enumDecode(_$ThirdPartyStatusEnumMap, json['thirdPartyStatus']),
    );

Map<String, dynamic> _$ThirdPartyStatusResponseToJson(
        ThirdPartyStatusResponse instance) =>
    <String, dynamic>{
      'thirdPartyStatus': _$ThirdPartyStatusEnumMap[instance.thirdPartyStatus]!,
    };

const _$ThirdPartyStatusEnumMap = {
  ThirdPartyStatus.waiting: 'WAITING',
  ThirdPartyStatus.initialized: 'INITIALIZED',
  ThirdPartyStatus.authorized: 'AUTHORIZED',
  ThirdPartyStatus.completed: 'COMPLETED',
};
