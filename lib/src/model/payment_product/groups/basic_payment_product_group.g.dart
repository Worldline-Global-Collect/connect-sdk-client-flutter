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

part of 'basic_payment_product_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicPaymentProductGroup _$BasicPaymentProductGroupFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return BasicPaymentProductGroup(
    json['id'] as String,
    PaymentItemDisplayHints.fromJson(
        json['displayHints'] as Map<String, dynamic>),
    json['allowsInstallments'] as bool,
    json['deviceFingerprintEnabled'] as bool,
    accountsOnFile: (json['accountsOnFile'] as List<dynamic>?)
            ?.map((e) => AccountOnFile.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$BasicPaymentProductGroupToJson(
        BasicPaymentProductGroup instance) =>
    <String, dynamic>{
      'accountsOnFile': instance.accountsOnFile,
      'allowsInstallments': instance.allowsInstallments,
      'deviceFingerprintEnabled': instance.deviceFingerprintEnabled,
      'displayHints': instance.displayHints,
      'id': instance.id,
    };
