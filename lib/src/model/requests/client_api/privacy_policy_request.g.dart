/*
 *
 *  * Do not remove or alter the notices in this preamble.
 *  *
 *  * This software is owned by Worldline Global Collect and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *  *
 *  * Copyright © 2024 Worldline Global Collect and/or its affiliates.
 *  *
 *  * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *  *
 *  * Please contact Worldline Global Collect for questions regarding license and user rights.
 *
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyPolicyRequest _$PrivacyPolicyRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['paymentProductId'],
  );
  return PrivacyPolicyRequest(
    paymentProductId: json['paymentProductId'] as String?,
    locale: json['locale'] as String?,
  );
}

Map<String, dynamic> _$PrivacyPolicyRequestToJson(
        PrivacyPolicyRequest instance) =>
    <String, dynamic>{
      'paymentProductId': instance.paymentProductId,
      'locale': instance.locale,
    };
