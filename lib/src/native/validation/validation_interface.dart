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

abstract class _ValidationInterface extends PlatformInterface {
  _ValidationInterface() : super(token: _token);

  static final Object _token = Object();
  static final _ValidationInterface _validationChannel = _ValidationChannel();
  static _ValidationInterface get instance => _validationChannel;

  Future<String> validatePaymentRequest(String request) {
    throw UnimplementedError(
        "Validate payment request has not been implemented");
  }

  Future<String> validatePaymentProductField(String request) {
    throw UnimplementedError(
        "Validate payment request has not been implemented");
  }

  Future<String> validatePaymentRequestForValidationRule(
      String validationRequest) {
    throw UnimplementedError("Validate has not been implemented");
  }
}
