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

struct ResultError: Encodable {
    let code: String
    let message: String

    static func sdkNotInitialized() -> FlutterError {
        return FlutterError(code: ResultErrorCode.sdkNotInitialized.rawValue, message: "ConnectSDK is not initialized. Please initialize it first by calling ConnectSDK.initialize", details: nil)
    }
    
    static func missingInitializeSDKArgument(argument: String) -> FlutterError {
        return FlutterError(code: ResultErrorCode.missingInitializeSDKArgument.rawValue, message: "Missing required argument '\(argument)' for initializing the ConnectSDK.", details: nil)
    }

    static func missingRequestArgument(request: String, call: FlutterMethodCall) -> FlutterError {
        return FlutterError(code: ResultErrorCode.missingRequestArgument.rawValue, message: "Missing required request '\(request)' for method : \(call.method)", details: nil)
    }

    static func dataError<T: Decodable>(object: T.Type, call: FlutterMethodCall) -> FlutterError {
        return FlutterError(code: ResultErrorCode.dataError.rawValue, message: "Could not create Data object of \(object.self) for method : \(call.method)", details: nil)
    }

    static func decodingError<T: Decodable>(object: T.Type, call: FlutterMethodCall) -> FlutterError {
        return FlutterError(code: ResultErrorCode.decodingError.rawValue, message: "Could not decode \(object.self) for method : \(call.method)", details: nil)
    }

    static func encodingError(type: EncodingErrorType) -> FlutterError {
        return FlutterError(code: ResultErrorCode.encodingError.rawValue, message: "Could not encode \(type) to String", details: nil)
    }
}

enum ResultErrorCode: String {
    case sdkNotInitialized = "1"
    case missingInitializeSDKArgument = "2"
    case missingRequestArgument = "3"
    case dataError = "4"
    case decodingError = "5"
    case encodingError = "6"
}

enum EncodingErrorType {
    case success
    case failure
    case apiFailure
    case maskedValuesDictionary
    case unmaskedValuesDictionary
    case validationErrors
}
