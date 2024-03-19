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

part of 'validator.dart';

class _ValidationChannel extends _ValidationInterface {
  final _validationChannel = const MethodChannel('validation_channel');

  @override
  Future<String> validatePaymentRequest(String request) async {
    final result = await _validationChannel
        .invokeMethod('validatePaymentRequest', {"request": request});
    return result;
  }

  @override
  Future<String> validatePaymentProductField(String request) async {
    final result = await _validationChannel
        .invokeMethod('validatePaymentRequest', {"request": request});
    return result;
  }

  @override
  Future<String> validatePaymentRequestForValidationRule(
      String validationRequest) async {
    final result = await _validationChannel.invokeMethod(
        'validatePaymentRequestForValidationRule',
        {"request": validationRequest});
    return result;
  }
}
