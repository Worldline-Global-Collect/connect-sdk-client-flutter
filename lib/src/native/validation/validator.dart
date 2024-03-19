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

library validator;

import 'package:connect_sdk_client_flutter/src/model/models.dart';
import 'package:connect_sdk_client_flutter/src/model/requests/requests.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'validation_interface.dart';
part 'validation_channel.dart';

final class PaymentRequestValidator {
  static _ValidationInterface get _validator => _ValidationInterface.instance;

  static Future<List<ValidationErrorMessage>> validatePaymentRequest(
      PaymentRequest paymentRequest) async {
    final validationRequest =
        PaymentRequestValidationRequest(paymentRequest).toJsonString();
    final validationResult =
        await _validator.validatePaymentRequest(validationRequest);
    return ValidationErrorMessage.fromJsonString(validationResult);
  }
}

final class PaymentProductFieldValidator {
  static _ValidationInterface get _validator => _ValidationInterface.instance;

  static Future<List<ValidationErrorMessage>> validatePaymentProductField(
      PaymentRequest paymentRequest, PaymentProductField field) async {
    final validationRequest =
        PaymentProductFieldValidationRequest(paymentRequest, field)
            .toJsonString();
    final validationResult =
        await _validator.validatePaymentProductField(validationRequest);
    return ValidationErrorMessage.fromJsonString(validationResult);
  }
}

final class ValidationRuleValidator {
  static _ValidationInterface get _validator => _ValidationInterface.instance;

  static Future<List<ValidationErrorMessage>>
      validateValidationRuleForPaymentRequestAndFieldId(
          PaymentRequest paymentRequest,
          String paymentProductFieldId,
          ValidationRule rule) async {
    final validationRequest = PaymentRequestRuleValidationRequest(
            paymentRequest, paymentProductFieldId, rule)
        .toJsonString();
    final validationResult = await _validator
        .validatePaymentRequestForValidationRule(validationRequest);
    return ValidationErrorMessage.fromJsonString(validationResult);
  }
}
