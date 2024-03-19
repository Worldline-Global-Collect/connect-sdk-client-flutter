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

part of 'masker.dart';

abstract class _MaskingInterface extends PlatformInterface {
  _MaskingInterface() : super(token: _token);

  static final Object _token = Object();

  static final _MaskingInterface _maskingChannel = _MaskingChannel();

  static _MaskingInterface get instance => _maskingChannel;

  Future<String> applyMaskForPaymentProductField(String applyMaskRequest) {
    throw UnimplementedError(
        "applyMaskForPaymentProductField has not been implemented");
  }

  Future<String> removeMaskForPaymentProductField(String removeMaskRequest) {
    throw UnimplementedError(
        "removeMaskForPaymentProductField has not been implemented");
  }

  Future<String> maskedValueForPaymentRequest(String maskedValueRequest) {
    throw UnimplementedError(
        "maskedValueForPaymentRequest has not been implemented");
  }

  Future<String> unmaskedValueForPaymentRequest(String unmaskedValueRequest) {
    throw UnimplementedError(
        "unmaskedValueForPaymentRequest has not been implemented");
  }

  Future<String?> allMaskedValuesForPaymentRequest(
      String allMaskedValuesRequest) {
    throw UnimplementedError(
        "allMaskedValuesForPaymentRequest has not been implemented");
  }

  Future<String?> allUnmaskedValuesForPaymentRequest(
      String allUnmaskedValuesRequest) {
    throw UnimplementedError(
        "allUnmaskedValuesForPaymentRequest has not been implemented");
  }

  Future<String> maskedValueForAccountOnFile(String maskedValueRequest) {
    throw UnimplementedError(
        "maskedValueForAccountOnFile has not been implemented");
  }

  Future<String> customMaskedValueForAccountOnFile(
      String customMaskedValueRequest) {
    throw UnimplementedError(
        "customMaskedValueForAccountOnFile has not been implemented");
  }
}
