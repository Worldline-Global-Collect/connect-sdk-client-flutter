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

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'validation_error_message.g.dart';

/// Contains error message information for a specific [PaymentProductField].
@JsonSerializable()
class ValidationErrorMessage {
  /// Details about the validation error that was raised.
  final String errorMessage;

  /// The identifier of the [PaymentProductField] for which this error message was raised during validation.
  final String paymentProductFieldId;

  /// If provided, the detailed [ValidationRule] that raised this error message.
  @JsonKey(fromJson: validationRuleFromJson)
  final ValidationRule? rule;

  ValidationErrorMessage(
      {required this.errorMessage,
      required this.paymentProductFieldId,
      this.rule});

  factory ValidationErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorMessageToJson(this);

  static List<ValidationErrorMessage> fromJsonString(String jsonString) {
    List<dynamic> json = jsonDecode(jsonString);
    return json
        .map((vem) => ValidationErrorMessage.fromJson(vem))
        .toList(growable: false);
  }
}

ValidationRule? validationRuleFromJson(dynamic json) {
  String? validationType = json?["validationType"];

  if (validationType == null) {
    return null;
  }

  switch (validationType) {
    case ValidationType.boletoBancarioRequirednessKey:
      return ValidationRuleBoletoBancarioRequiredness.fromJson(json);
    case ValidationType.expirationDateKey:
      return ValidationRuleExpirationDate.fromJson(json);
    case ValidationType.emailAddressKey:
      return ValidationRuleEmailAddress.fromJson(json);
    case ValidationType.fixedListKey:
      return ValidationRuleFixedList.fromJson(json);
    case ValidationType.ibanKey:
      return ValidationRuleIBAN.fromJson(json);
    case ValidationType.lengthKey:
      return ValidationRuleLength.fromJson(json);
    case ValidationType.luhnKey:
      return ValidationRuleLuhn.fromJson(json);
    case ValidationType.rangeKey:
      return ValidationRuleRange.fromJson(json);
    case ValidationType.regularExpressionKey:
      return ValidationRuleRegularExpression.fromJson(json);
    case ValidationType.residentIdNumberKey:
      return ValidationRuleResidentIdNumber.fromJson(json);
    case ValidationType.termsAndConditionsKey:
      return ValidationRuleTermsAndConditions.fromJson(json);
    default:
      return ValidationRule(ValidationType.type, "validationRule");
  }
}
