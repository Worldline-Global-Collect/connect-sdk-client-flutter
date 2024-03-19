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

part of '../../../connect_sdk.dart';

class _ConnectSDKCommunicator {
  Future<bool> initializeSdk(InitializeConnectSdkRequest request) {
    final requestStr = jsonEncode(request);
    return _ConnectSDKInterface.instance.initialize(requestStr);
  }

  _NativeFuture<EncryptedPaymentRequest> encryptPaymentRequest(
      SdkPreparePaymentRequest paymentRequest,
      _NativeFutureListener<EncryptedPaymentRequest> listener) {
    final request = jsonEncode(paymentRequest);
    return _NativeFuture(
        _ConnectSDKInterface.instance.encryptPaymentRequest(request),
        (data) =>
            EncryptedPaymentRequest.fromJson(data as Map<String, dynamic>),
        listener);
  }
}
