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

// This class is used to initialize the Connect SDK in the unit tests
class SDKTestInitializer {
  static late ConnectSDK connectSDK;

  static initializeConnectSDK() async {
    final sessionConfiguration = SessionConfiguration(
        clientSessionId: "_clientSessionId",
        customerId: "_customerId",
        clientApiUrl: "_clientApiUrl",
        assetUrl: "_assetUrl");

    final connectSDKConfiguration =
        ConnectSDKConfiguration(sessionConfiguration, enableNetworkLogs: true);

    final paymentContext =
        PaymentContext(AmountOfMoney(100, "EUR"), "NL", false);

    final paymentConfiguration = PaymentConfiguration(paymentContext);

    // Initialize connectSDK
    ConnectSDK.connectSDK.initialize(
        connectSDKConfiguration: connectSDKConfiguration,
        paymentConfiguration: paymentConfiguration);

    connectSDK = ConnectSDK.connectSDK;
  }
}
