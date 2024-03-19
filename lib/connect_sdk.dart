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

/// The `connect_sdk_client_flutter` library is a Flutter plugin that allows Flutter apps for Android and iOS to integrate with the Connect Gateway.
/// It does this by providing a bridge between the Flutter codebase and the existing Android/Swift native SDKs.
/// This bridge is structured similar to the structure of the Android and Swift SDK.
/// [ConnectSDK] provides an entrypoint into the SDK.
/// This needs to be initialized using a [ConnectSDKConfiguration] and a [PaymentConfiguration].
/// After initialization, execute API calls using the [ClientApi] or prepare a payment using [ConnectSDK.encryptPaymentRequest]
library connect_sdk_client_flutter;

import 'dart:convert';

import 'package:connect_sdk_client_flutter/src/configuration/configuration.dart';
import 'package:connect_sdk_client_flutter/src/model/models.dart';
import 'package:connect_sdk_client_flutter/src/model/requests/requests.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'src/configuration/configuration.dart';
export 'src/model/models.dart';

part 'src/exception/connect_sdk_exception.dart';
part 'src/exception/client_api_exception.dart';
part 'src/connect_sdk/connect_sdk.dart';
part 'src/connect_sdk/client_api.dart';
part 'src/connect_sdk/sdk_initialization_status.dart';
part 'src/native/connect_sdk/connect_sdk_channel.dart';
part 'src/native/connect_sdk/connect_sdk_communicator.dart';
part 'src/native/connect_sdk/connect_sdk_interface.dart';
part 'src/native/client_api/client_api_channel.dart';
part 'src/native/client_api/client_api_communicator.dart';
part 'src/native/client_api/client_api_interface.dart';
part 'src/native/native_future.dart';
part 'src/native/native_future_interface.dart';

/// The ConnectSDK class is the entrance point into the SDK.
abstract class ConnectSDK {
  /// Private static instance of implementation class of the ConnectSDK.
  static final ConnectSDK _instance = _ConnectSDKImpl();

  /// Static get method for the private static instance
  static ConnectSDK get connectSDK => _instance;

  /// This instance variable shows the current initialization status of the SDK.
  SdkInitializationStatus get initializationStatus;

  /// Initializes the SDK using the provided configurations.
  ///
  /// This method has to be called prior to any of the other SDK functionalities.
  /// The SDK is initialized for a specific payment.
  /// If the [PaymentContext] changes, or a new session is created, this function should be called again with updated configurations.
  initialize(
      {required ConnectSDKConfiguration connectSDKConfiguration,
      required PaymentConfiguration paymentConfiguration});

  /// Returns the ClientApi.
  ///
  /// Throws [ClientApiException] if the SDK is not yet initialized.
  ClientApi getClientApi();

  /// Returns the [ConnectSDKConfiguration] that was used in initialization.
  ///
  /// Throws [ConnectSDKException] if the SDK is not yet initialized.
  ConnectSDKConfiguration getConnectSDKConfiguration();

  /// Returns the [PaymentConfiguration] that was used in initialization.
  ///
  /// Throws [ConnectSDKException] if the SDK is not yet initialized.
  PaymentConfiguration getPaymentConfiguration();

  /// Processes the [SdkPreparePaymentRequest].
  ///
  /// This method first retrieves the associated public key and then uses this to encrypt the [PaymentRequest] from the [SdkPreparePaymentRequest].
  /// The result of this preparation will be provided by a callback on either [onSuccess] if the preparation was successful or [onFailure] if it was not.
  /// If successful, the resulting [EncryptedPaymentRequest] can be used to finish the payment.
  /// If unsuccessful, the [NativeException] returned will provide additional information regarding the failure.
  encryptPaymentRequest(
      {required SdkPreparePaymentRequest paymentRequest,
      required void Function(EncryptedPaymentRequest encryptedPaymentRequest)
          onSuccess,
      required void Function(NativeException e) onFailure});
}
