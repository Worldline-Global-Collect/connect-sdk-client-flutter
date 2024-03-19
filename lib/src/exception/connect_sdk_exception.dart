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

part of '../../connect_sdk.dart';

/// Exception that gets thrown when trying to access the [PaymentConfiguration] or the [ConnectSDKConfiguration] before initialization of the [ConnectSDK].
class ConnectSDKException implements Exception {
  String cause =
      "ConnectSDK must be initialized before performing this operation.";
}
