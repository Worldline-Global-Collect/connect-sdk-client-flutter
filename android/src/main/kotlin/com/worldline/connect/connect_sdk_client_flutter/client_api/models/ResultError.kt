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

package com.worldline.connect.connect_sdk_client_flutter.client_api.models

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

data class ResultError(val code : String, val message: String) {
    companion object {
        enum class ResultErrorCode(val id: String) {
            SDK_NOT_INITIALIZED("1"),
            MISSING_INITIALIZE_SDK_ARGUMENT("2"),
            MISSING_REQUEST_ARGUMENT("3"),
            MISSING_CONTEXT("4"),
        }

        fun sdkNotInitialized(result: MethodChannel.Result) {
            return result.error(ResultErrorCode.SDK_NOT_INITIALIZED.id, "ConnectSDK is not initialized. Please initialize it first by calling ConnectSDK.initialize.", null)
        }

        fun missingInitializeSDKArgument(argument: String, result: MethodChannel.Result) {
            return result.error(ResultErrorCode.MISSING_INITIALIZE_SDK_ARGUMENT.id, "Missing required argument '$argument' for initializing the ConnectSDK.", null)
        }

        fun missingRequestArgument(request: String, call: MethodCall, result: MethodChannel.Result) {
            return result.error(ResultErrorCode.MISSING_REQUEST_ARGUMENT.id, "Missing required request '$request' for method : ${call.method}", null)
        }

        fun missingContext(result: MethodChannel.Result) {
            return result.error(ResultErrorCode.MISSING_CONTEXT.id, "No context available to initialize ConnectSDK", null)
        }
    }
}
