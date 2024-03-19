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

internal class ClientApiMethodCallHandler: ConnectSdkPlugin {
    private let connectSDKBridge = ConnectSDKBridge.shared

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPublicKey":
            getPublicKey(result)
        case "getBasicPaymentProducts":
            getBasicPaymentProducts(result)
        case "getPaymentProduct":
            getPaymentProduct(call, result)
        case "getPrivacyPolicy":
            getPrivacyPolicy(call, result)
        case "getIinDetails":
            getIinDetails(call, result)
        case "getBasicPaymentProductGroups":
            getBasicPaymentProductGroups(result)
        case "getPaymentProductGroup":
            getPaymentProductGroup(call, result)
        case "getPaymentItems":
            getPaymentItems(result)
        case "getPaymentProductDirectory":
            getPaymentProductDirectory(call, result)
        case "getThirdPartyStatus":
            getThirdPartyStatus(call, result)
        case "convertAmount":
            convertAmount(call, result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func getPublicKey(_ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            self.connectSDKBridge.getPublicKey(result: result)
        }
    }
    
    private func getBasicPaymentProducts(_ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            self.connectSDKBridge.getBasicPaymentProducts(result: result)
        }
    }

    private func getPaymentProduct(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let paymentProductRequest = PaymentProductRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getPaymentProduct(request: paymentProductRequest, result: result)
        }
    }
    
    private func getPrivacyPolicy(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let privacyPolicyRequest = PrivacyPolicyRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getPrivacyPolicy(request: privacyPolicyRequest, result: result)
        }
    }

    private func getIinDetails(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let iinDetailsRequest = IinDetailsRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getIinDetails(request: iinDetailsRequest, result: result)
        }
    }

    private func getBasicPaymentProductGroups(_ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            self.connectSDKBridge.getPaymentProductGroups(result: result)
        }
    }
    
    private func getPaymentProductGroup(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let paymentProductGroupRequest = PaymentProductGroupRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getPaymentProductGroup(request: paymentProductGroupRequest, result: result)
        }
    }
    
    private func getPaymentItems(_ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            self.connectSDKBridge.getPaymentItems(result: result)
        }
    }
    
    private func getPaymentProductDirectory(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let paymentProductDirectoryRequest = PaymentProductDirectoryRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getPaymentProductDirectory(request: paymentProductDirectoryRequest, result: result)
        }
    }
    
    private func getThirdPartyStatus(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let thirdPartyStatusRequest = ThirdPartyStatusRequest.getRequestObject(for: call, result: result) else {
                return
            }
            
            self.connectSDKBridge.getThirdPartyStatus(request: thirdPartyStatusRequest, result: result)
        }
    }
    
    private func convertAmount(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        connectSDKBridge.executeWhenInitialized(result) {
            guard let convertAmountRequest = ConvertAmountRequest.getRequestObject(for: call, result: result) else {
                return
            }

            self.connectSDKBridge.convertAmount(request: convertAmountRequest, result: result)
        }
    }
}
