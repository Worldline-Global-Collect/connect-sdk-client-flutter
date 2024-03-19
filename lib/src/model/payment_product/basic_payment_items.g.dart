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

part of 'basic_payment_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicPaymentItems _$BasicPaymentItemsFromJson(Map<String, dynamic> json) =>
    BasicPaymentItems(
      _basicPaymentItemsFromJson(json['basicPaymentItems'] as List),
      accountsOnFile: (json['accountsOnFile'] as List<dynamic>?)
          ?.map((e) => AccountOnFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BasicPaymentItemsToJson(BasicPaymentItems instance) =>
    <String, dynamic>{
      'basicPaymentItems': instance.basicPaymentItems,
      'accountsOnFile': instance.accountsOnFile,
    };
