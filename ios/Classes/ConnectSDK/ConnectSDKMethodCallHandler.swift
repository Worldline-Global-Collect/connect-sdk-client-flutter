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
import WorldlineConnectKit

internal class ConnectSDKMethodCallHandler: ConnectSdkPlugin {
    private let connectSDKBridge = ConnectSDKBridge.shared

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            initializeConnectSDK(call, result)
        case "encryptPaymentRequest":
            encryptPaymentRequest(call, result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func initializeConnectSDK(_ call: FlutterMethodCall,_ result: @escaping FlutterResult) {
        guard let initializeRequest = InitializeSDKRequest.getRequestObject(for: call, result: result) else {
            return
        }

        if let missingInitializeArgumentError = assertInitializationArguments(request: initializeRequest) {
            result(missingInitializeArgumentError)
            return
        }

        connectSDKBridge.initializeConnectSDK(request: initializeRequest)

        result(connectSDKBridge.isInitialized())
    }

    private func assertInitializationArguments(request: InitializeSDKRequest) -> FlutterError? {
        let sessionConfiguration = request.connectSdkConfiguration.sessionConfiguration
        
        if sessionConfiguration.clientSessionId.isEmptyOrWhitespace() {
            return ResultError.missingInitializeSDKArgument(argument: "clientSessionId")
        } else if sessionConfiguration.customerId.isEmptyOrWhitespace() {
            return ResultError.missingInitializeSDKArgument(argument: "customerId")
        } else if sessionConfiguration.clientApiUrl.isEmptyOrWhitespace() {
            return ResultError.missingInitializeSDKArgument(argument: "clientApiUrl")
        } else if sessionConfiguration.assetUrl.isEmptyOrWhitespace() {
            return ResultError.missingInitializeSDKArgument(argument: "assetUrl")
        } else { return nil }
    }

    private func encryptPaymentRequest(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let paymentRequest = EncryptPaymentRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.encryptPaymentRequest(request: paymentRequest, result: result)
        }
    }
}
