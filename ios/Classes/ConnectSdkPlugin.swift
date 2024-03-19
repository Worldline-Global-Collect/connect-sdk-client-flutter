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

import Flutter
import UIKit

public class ConnectSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      let connectSDKChannel = FlutterMethodChannel(name: "connect_sdk_channel", binaryMessenger: registrar.messenger())
      let connectSDKHandlerInstance = ConnectSDKMethodCallHandler()
      
      let clientApiChannel = FlutterMethodChannel(name: "client_api_channel", binaryMessenger: registrar.messenger())
      let clientApiHandlerInstance = ClientApiMethodCallHandler()

      let validationChannel = FlutterMethodChannel(name: "validation_channel", binaryMessenger: registrar.messenger())
      let validationHandlerInstance = ValidatorMethodCallHandler()

      let maskingChannel = FlutterMethodChannel(name: "masking_channel", binaryMessenger: registrar.messenger())
      let maskingHandlerInstance = MaskingMethodCallHandler()

      registrar.addMethodCallDelegate(connectSDKHandlerInstance, channel: connectSDKChannel)
      registrar.addMethodCallDelegate(clientApiHandlerInstance, channel: clientApiChannel)
      registrar.addMethodCallDelegate(validationHandlerInstance, channel: validationChannel)
      registrar.addMethodCallDelegate(maskingHandlerInstance, channel: maskingChannel)
  }
}
