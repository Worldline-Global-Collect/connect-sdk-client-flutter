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

import 'package:connect_sdk_client_flutter/connect_sdk.dart';
import 'package:connect_sdk_client_flutter/src/native/validation/validator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation_rule.g.dart';

/// Contains functionality to handle validation.
@JsonSerializable()
class ValidationRule implements ValidationRuleFunctions {
  @JsonKey(required: true)
  final ValidationType validationType;

  @JsonKey(required: true)
  final String messageId;

  ValidationRule(this.validationType, this.messageId);

  factory ValidationRule.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationRuleToJson(this);

  @override
  Future<List<ValidationErrorMessage>> validateValueForFieldOfPaymentRequest(
      {required String fieldId, required PaymentRequest request}) async {
    return await ValidationRuleValidator
        .validateValidationRuleForPaymentRequestAndFieldId(
            request, fieldId, this);
  }
}

abstract class ValidationRuleFunctions {
  /// Validates the value of the [PaymentProductField] corresponding to the provided [fieldId] in the provided [request].
  validateValueForFieldOfPaymentRequest(
      {required String fieldId, required PaymentRequest request});
}
