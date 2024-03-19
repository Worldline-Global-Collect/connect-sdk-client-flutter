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

import 'package:json_annotation/json_annotation.dart';
import '../../models.dart';

part 'data_restrictions.g.dart';

/// Represents a DataRestrictions object that is used for validating user input.
@JsonSerializable(explicitToJson: true)
class DataRestrictions {
  /// Whether this field is required.
  @JsonKey(required: true)
  final bool isRequired;

  /// A list of validation rules for a [PaymentProductField].
  @JsonKey(fromJson: _validationRulesFromJson)
  final List<ValidationRule> validationRules;

  DataRestrictions({required this.isRequired, required this.validationRules});

  const DataRestrictions.empty(
      {this.isRequired = false, this.validationRules = const []});

  factory DataRestrictions.fromJson(Map<String, dynamic> json) =>
      _$DataRestrictionsFromJson(json);

  Map<String, dynamic> toJson() => _$DataRestrictionsToJson(this);
}

List<ValidationRule> _validationRulesFromJson(List<dynamic> json) {
  return json.map((e) {
    String validationType = e["validationType"];
    switch (validationType) {
      case ValidationType.boletoBancarioRequirednessKey:
        return ValidationRuleBoletoBancarioRequiredness.fromJson(e);
      case ValidationType.expirationDateKey:
        return ValidationRuleExpirationDate.fromJson(e);
      case ValidationType.emailAddressKey:
        return ValidationRuleEmailAddress.fromJson(e);
      case ValidationType.fixedListKey:
        return ValidationRuleFixedList.fromJson(e);
      case ValidationType.ibanKey:
        return ValidationRuleIBAN.fromJson(e);
      case ValidationType.lengthKey:
        return ValidationRuleLength.fromJson(e);
      case ValidationType.luhnKey:
        return ValidationRuleLuhn.fromJson(e);
      case ValidationType.rangeKey:
        return ValidationRuleRange.fromJson(e);
      case ValidationType.regularExpressionKey:
        return ValidationRuleRegularExpression.fromJson(e);
      case ValidationType.residentIdNumberKey:
        return ValidationRuleResidentIdNumber.fromJson(e);
      case ValidationType.termsAndConditionsKey:
        return ValidationRuleTermsAndConditions.fromJson(e);
      default:
        return ValidationRule(ValidationType.type, "validationRule");
    }
  }).toList();
}
