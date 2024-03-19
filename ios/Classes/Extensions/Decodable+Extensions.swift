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

internal extension Decodable {
    static func getRequestObject(for call: FlutterMethodCall, result: FlutterResult) -> Self? {
        guard let dataJson = getDataOfRequest(for: call, result: result) else {
            return nil
        }

        guard let requestObject = try? JSONDecoder().decode(Self.self, from: dataJson) else {
            result(ResultError.decodingError(object: Self.self, call: call))
            return nil
        }

        return requestObject
    }

    private static func getDataOfRequest(for call: FlutterMethodCall, result: FlutterResult) -> Data? {
        guard let arguments = call.arguments as? Dictionary<String, Any>,
              let requestJson = arguments["request"] as? String else {
            result(ResultError.missingRequestArgument(request: "\(Self.self)", call: call))
            return nil
        }

        guard let dataJson = requestJson.data(using: .utf8) else {
            result(ResultError.dataError(object: Self.self, call: call))
            return nil
        }

        return dataJson
    }
}
