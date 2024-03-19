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

part of 'initialize_connect_sdk_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializeConnectSdkRequest _$InitializeConnectSdkRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['connectSdkConfiguration', 'paymentConfiguration'],
  );
  return InitializeConnectSdkRequest(
    ConnectSDKConfiguration.fromJson(
        json['connectSdkConfiguration'] as Map<String, dynamic>),
    PaymentConfiguration.fromJson(
        json['paymentConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InitializeConnectSdkRequestToJson(
        InitializeConnectSdkRequest instance) =>
    <String, dynamic>{
      'connectSdkConfiguration': instance.connectSdkConfiguration.toJson(),
      'paymentConfiguration': instance.paymentConfiguration.toJson(),
    };
