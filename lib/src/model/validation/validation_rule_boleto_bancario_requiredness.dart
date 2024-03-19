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

import '../models.dart';

part 'validation_rule_boleto_bancario_requiredness.g.dart';

@JsonSerializable()
class ValidationRuleBoletoBancarioRequiredness extends ValidationRule {
  static const _fiscalNumberFieldId = "fiscalNumber";

  @JsonKey()
  final int fiscalNumberLengthToValidate;

  ValidationRuleBoletoBancarioRequiredness(this.fiscalNumberLengthToValidate,
      ValidationType validationType, String messageId)
      : super(validationType, messageId);

  factory ValidationRuleBoletoBancarioRequiredness.fromJson(
          Map<String, dynamic> json) =>
      _$ValidationRuleBoletoBancarioRequirednessFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ValidationRuleBoletoBancarioRequirednessToJson(this);

  /// Validates if the field is required based on the length of the Fiscal Number field.
  ///
  bool isFieldRequired(PaymentRequest paymentRequest) {
    final String fiscalNumber =
        paymentRequest.getValue(_fiscalNumberFieldId) ?? "";
    return fiscalNumberLengthToValidate == fiscalNumber.length;
  }
}
