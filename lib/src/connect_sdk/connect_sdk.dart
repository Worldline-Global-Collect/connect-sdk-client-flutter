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

// Implementing class for the ConnectSDK
part of '../../connect_sdk.dart';

/// Implementation class of the [ConnectSDK].
@JsonSerializable()
final class _ConnectSDKImpl extends ConnectSDK {
  ClientApi? _clientApi;
  ConnectSDKConfiguration? _connectSDKConfiguration;
  PaymentConfiguration? _paymentConfiguration;

  SdkInitializationStatus _initializationStatus =
      SdkInitializationStatus.uninitialized;
  @override
  SdkInitializationStatus get initializationStatus => _initializationStatus;

  final _ConnectSDKCommunicator _connectCommunicator =
      _ConnectSDKCommunicator();

  @override
  initialize({
    required ConnectSDKConfiguration connectSDKConfiguration,
    required PaymentConfiguration paymentConfiguration,
  }) {
    _initializationStatus = SdkInitializationStatus.initializing;
    _clientApi = ClientApi(connectSDKConfiguration);
    _connectSDKConfiguration = connectSDKConfiguration;
    _paymentConfiguration = paymentConfiguration;
    _initializeNativeSdk(connectSDKConfiguration, paymentConfiguration);
  }

  _initializeNativeSdk(
    ConnectSDKConfiguration connectSDKConfiguration,
    PaymentConfiguration paymentConfiguration,
  ) async {
    final SdkInitializationStatus result = await _connectCommunicator
        .initializeSdk(InitializeConnectSdkRequest(
            connectSDKConfiguration, paymentConfiguration))
        .then((result) => result
            ? SdkInitializationStatus.initialized
            : SdkInitializationStatus.initializationError)
        .onError((_, __) {
      return SdkInitializationStatus.initializationError;
    });
    _initializationStatus = result;
  }

  @override
  ClientApi getClientApi() {
    final client = _clientApi;
    if (client != null) {
      return client;
    } else {
      throw ClientApiException();
    }
  }

  @override
  ConnectSDKConfiguration getConnectSDKConfiguration() {
    final config = _connectSDKConfiguration;
    if (config != null) {
      return config;
    } else {
      throw ConnectSDKException();
    }
  }

  @override
  PaymentConfiguration getPaymentConfiguration() {
    final config = _paymentConfiguration;
    if (config != null) {
      return config;
    } else {
      throw ConnectSDKException();
    }
  }

  @override
  encryptPaymentRequest({
    required SdkPreparePaymentRequest paymentRequest,
    required void Function(EncryptedPaymentRequest encryptedPaymentRequest)
        onSuccess,
    required void Function(NativeException e) onFailure,
  }) {
    _connectCommunicator
        .encryptPaymentRequest(
            paymentRequest,
            _NativeFutureListener(
                success: onSuccess,
                apiError: (apiError) =>
                    onFailure(NativeException.fromApiErrorResponse(apiError)),
                failure: onFailure))
        .awaitJob();
  }
}
