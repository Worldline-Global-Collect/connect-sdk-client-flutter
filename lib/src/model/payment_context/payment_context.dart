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

import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'payment_context.g.dart';

/// Contains information about a payment, like its [AmountOfMoney] and countryCode.
@JsonSerializable(
  explicitToJson: true,
)
class PaymentContext {
  /// The amount of money for this payment.
  @JsonKey(required: true)
  AmountOfMoney amountOfMoney;

  /// Country code of the Country where the transaction will take place, should match the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO-3166-alpha-2 standard</a>.
  @JsonKey(required: true)
  String countryCode;

  /// Whether this payment is a recurring one.
  @JsonKey(required: true)
  bool isRecurring;

  /// Whether to force the basic flow.
  @JsonKey(required: true)
  bool forceBasicFlow;

  // Provide as languageCode_countryCode
  @JsonKey(required: false, toJson: localeToJson, fromJson: localeFromJson)
  Locale? locale;

  PaymentContext(this.amountOfMoney, this.countryCode, this.isRecurring,
      {this.forceBasicFlow = false, this.locale});

  factory PaymentContext.fromJson(Map<String, dynamic> json) =>
      _$PaymentContextFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentContextToJson(this);

  static Locale localeFromJson(String? json) {
    if (json == null || json.isEmpty) {
      return const Locale("unknown", null);
    }
    List<String> parts = json.split('_');
    if (parts.length == 2) {
      return Locale.fromSubtags(languageCode: parts[0], countryCode: parts[1]);
    } else if (parts.length == 1) {
      return Locale.fromSubtags(languageCode: parts[0], countryCode: null);
    } else {
      return const Locale("unknown", null);
    }
  }

  static String? localeToJson(Locale? locale) {
    if (locale == null) {
      return null;
    }

    if (locale.countryCode != null) {
      return "${locale.languageCode}_${locale.countryCode}";
    } else {
      return locale.languageCode;
    }
  }

  PaymentContext copyWith(
      {AmountOfMoney? amountOfMoney,
      String? countryCode,
      bool? isRecurring,
      bool? forceBasicFlow,
      Locale? locale}) {
    return PaymentContext(amountOfMoney ?? this.amountOfMoney,
        countryCode ?? this.countryCode, isRecurring ?? this.isRecurring,
        forceBasicFlow: forceBasicFlow ?? this.forceBasicFlow,
        locale: locale ?? this.locale);
  }
}
