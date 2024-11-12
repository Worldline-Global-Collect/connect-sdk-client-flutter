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

part of 'payment_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProduct _$PaymentProductFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['displayHints', 'id', 'fields'],
  );
  return PaymentProduct(
    json['id'] as String,
    json['paymentMethod'] as String,
    PaymentItemDisplayHints.fromJson(
        json['displayHints'] as Map<String, dynamic>),
    acquirerCountry: json['acquirerCountry'] as String? ?? "",
    accountsOnFile: (json['accountsOnFile'] as List<dynamic>?)
            ?.map((e) => AccountOnFile.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
    allowsInstallments: json['allowsInstallments'] as bool? ?? false,
    allowsRecurring: json['allowsRecurring'] as bool? ?? false,
    allowsTokenization: json['allowsTokenization'] as bool? ?? false,
    authenticationIndicator: json['authenticationIndicator'] == null
        ? null
        : AuthenticationIndicator.fromJson(
            json['authenticationIndicator'] as Map<String, dynamic>),
    autoTokenized: json['autoTokenized'] as bool? ?? false,
    deviceFingerprintEnabled:
        json['deviceFingerprintEnabled'] as bool? ?? false,
    maxAmount: (json['maxAmount'] as num?)?.toInt(),
    minAmount: (json['minAmount'] as num?)?.toInt(),
    mobileIntegrationLevel: $enumDecodeNullable(
        _$MobileIntegrationLevelEnumMap, json['mobileIntegrationLevel']),
    paymentProduct302SpecificData: json['paymentProduct302SpecificData'] == null
        ? null
        : PaymentProduct302SpecificData.fromJson(
            json['paymentProduct302SpecificData'] as Map<String, dynamic>),
    paymentProduct320SpecificData: json['paymentProduct320SpecificData'] == null
        ? null
        : PaymentProduct320SpecificData.fromJson(
            json['paymentProduct320SpecificData'] as Map<String, dynamic>),
    paymentProduct863SpecificData: json['paymentProduct863SpecificData'] == null
        ? null
        : PaymentProduct863SpecificData.fromJson(
            json['paymentProduct863SpecificData'] as Map<String, dynamic>),
    paymentProductGroup: json['paymentProductGroup'] as String?,
    usesRedirectionTo3rdParty:
        json['usesRedirectionTo3rdParty'] as bool? ?? false,
    supportsMandates: json['supportsMandates'] as bool? ?? false,
    fields: (json['fields'] as List<dynamic>?)
        ?.map((e) => PaymentProductField.fromJson(e as Map<String, dynamic>))
        .toList(),
    fieldsWarning: json['fieldsWarning'] as String?,
  );
}

Map<String, dynamic> _$PaymentProductToJson(PaymentProduct instance) =>
    <String, dynamic>{
      'accountsOnFile': instance.accountsOnFile.map((e) => e.toJson()).toList(),
      'acquirerCountry': instance.acquirerCountry,
      'allowsInstallments': instance.allowsInstallments,
      'allowsRecurring': instance.allowsRecurring,
      'allowsTokenization': instance.allowsTokenization,
      'authenticationIndicator': instance.authenticationIndicator?.toJson(),
      'autoTokenized': instance.autoTokenized,
      'deviceFingerprintEnabled': instance.deviceFingerprintEnabled,
      'displayHints': instance.displayHints.toJson(),
      'id': instance.id,
      'maxAmount': instance.maxAmount,
      'minAmount': instance.minAmount,
      'mobileIntegrationLevel':
          _$MobileIntegrationLevelEnumMap[instance.mobileIntegrationLevel],
      'paymentMethod': instance.paymentMethod,
      'paymentProduct302SpecificData':
          instance.paymentProduct302SpecificData?.toJson(),
      'paymentProduct320SpecificData':
          instance.paymentProduct320SpecificData?.toJson(),
      'paymentProduct863SpecificData':
          instance.paymentProduct863SpecificData?.toJson(),
      'paymentProductGroup': instance.paymentProductGroup,
      'usesRedirectionTo3rdParty': instance.usesRedirectionTo3rdParty,
      'supportsMandates': instance.supportsMandates,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'fieldsWarning': instance.fieldsWarning,
    };

const _$MobileIntegrationLevelEnumMap = {
  MobileIntegrationLevel.noSupport: 'NO_SUPPORT',
  MobileIntegrationLevel.basicSupport: 'BASIC_SUPPORT',
  MobileIntegrationLevel.optimisedSupport: 'OPTIMISED_SUPPORT',
};
