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

/// Enum with the different initialization states of the Connect SDK.
enum SdkInitializationStatus {
  uninitialized,
  initializing,
  initialized,
  initializationError
}

extension SdkInitializationStatusX on SdkInitializationStatus {
  /// Convenience function for checking if the [ConnectSDK] is initialized or not.
  bool isNotInitialized() => this != SdkInitializationStatus.initialized;
}
