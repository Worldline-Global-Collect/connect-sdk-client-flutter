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

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectSDKConfiguration _$ConnectSDKConfigurationFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'sessionConfiguration',
      'enableNetworkLogs',
      'applicationId',
      'ipAddress'
    ],
  );
  return ConnectSDKConfiguration(
    SessionConfiguration.fromJson(
        json['sessionConfiguration'] as Map<String, dynamic>),
    enableNetworkLogs: json['enableNetworkLogs'] as bool? ?? false,
    applicationId: json['applicationId'] as String?,
    ipAddress: json['ipAddress'] as String?,
  );
}

Map<String, dynamic> _$ConnectSDKConfigurationToJson(
        ConnectSDKConfiguration instance) =>
    <String, dynamic>{
      'sessionConfiguration': instance.sessionConfiguration,
      'enableNetworkLogs': instance.enableNetworkLogs,
      'applicationId': instance.applicationId,
      'ipAddress': instance.ipAddress,
      'preLoadImages': instance._preLoadImages,
    };

PaymentConfiguration _$PaymentConfigurationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['paymentContext', 'groupPaymentProducts'],
  );
  return PaymentConfiguration(
    PaymentContext.fromJson(json['paymentContext'] as Map<String, dynamic>),
    groupPaymentProducts: json['groupPaymentProducts'] as bool? ?? false,
  );
}

Map<String, dynamic> _$PaymentConfigurationToJson(
        PaymentConfiguration instance) =>
    <String, dynamic>{
      'paymentContext': instance.paymentContext,
      'groupPaymentProducts': instance.groupPaymentProducts,
    };

SessionConfiguration _$SessionConfigurationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'clientSessionId',
      'customerId',
      'clientApiUrl',
      'assetUrl'
    ],
  );
  return SessionConfiguration(
    clientSessionId: json['clientSessionId'] as String,
    customerId: json['customerId'] as String,
    clientApiUrl: json['clientApiUrl'] as String,
    assetUrl: json['assetUrl'] as String,
  );
}

Map<String, dynamic> _$SessionConfigurationToJson(
        SessionConfiguration instance) =>
    <String, dynamic>{
      'clientSessionId': instance.clientSessionId,
      'customerId': instance.customerId,
      'clientApiUrl': instance.clientApiUrl,
      'assetUrl': instance.assetUrl,
    };
