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

library;

import 'package:connect_sdk_client_flutter/src/model/models.dart';
import 'package:connect_sdk_client_flutter/src/model/requests/requests.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'masking_channel.dart';
part 'masking_interface.dart';

final class AccountOnFileMasker {
  static _MaskingInterface get _masker => _MaskingInterface.instance;

  static Future<String> maskedValue(AccountOnFile aof, String fieldId) async {
    final request =
        AccountOnFileMaskedValueRequest(aof, fieldId).toJsonString();
    return await _masker.maskedValueForAccountOnFile(request);
  }

  static Future<String> customMaskedValue(
      AccountOnFile aof, String fieldId, String mask) async {
    final request = AccountOnFileCustomMaskedValueRequest(aof, fieldId, mask)
        .toJsonString();
    return await _masker.customMaskedValueForAccountOnFile(request);
  }
}

final class PaymentProductFieldMasker {
  static _MaskingInterface get _masker => _MaskingInterface.instance;

  static Future<String> applyMask(
      PaymentProductField field, String value) async {
    final request =
        PaymentProductFieldMaskRequest.applyMask(field, value).toJsonString();
    return await _masker.applyMaskForPaymentProductField(request);
  }

  static Future<String> removeMask(
      PaymentProductField field, String value) async {
    final request =
        PaymentProductFieldMaskRequest.removeMask(field, value).toJsonString();
    return await _masker.removeMaskForPaymentProductField(request);
  }
}

final class PaymentRequestMasker {
  static _MaskingInterface get _masker => _MaskingInterface.instance;

  static Future<String> maskedValue(
      PaymentRequest paymentRequest, String fieldId) async {
    final request =
        PaymentRequestMaskedValueRequest.maskedValue(paymentRequest, fieldId)
            .toJsonString();
    return await _masker.maskedValueForPaymentRequest(request);
  }

  static Future<String> unmaskedValue(
      PaymentRequest paymentRequest, String fieldId) async {
    final request =
        PaymentRequestMaskedValueRequest.unmaskedValue(paymentRequest, fieldId)
            .toJsonString();
    return await _masker.unmaskedValueForPaymentRequest(request);
  }

  static Future<String?> maskedValues(PaymentRequest paymentRequest) async {
    final request =
        PaymentRequestAllMaskedValuesRequest.maskedValues(paymentRequest)
            .toJsonString();
    return await _masker.allMaskedValuesForPaymentRequest(request);
  }

  static Future<String?> unmaskedValues(PaymentRequest paymentRequest) async {
    final request =
        PaymentRequestAllMaskedValuesRequest.unmaskedValues(paymentRequest)
            .toJsonString();
    return await _masker.allUnmaskedValuesForPaymentRequest(request);
  }
}
