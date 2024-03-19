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

package com.worldline.connect.connect_sdk_client_flutter.validation

import com.google.gson.Gson
import com.worldline.connect.connect_sdk_client_flutter.getRequestOrReturnError
import com.worldline.connect.connect_sdk_client_flutter.validation.models.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class ValidationMethodCallHandler(private val gson: Gson)
    : MethodChannel.MethodCallHandler {
    companion object {
        private const val TAG = "ValidationMethodHandler"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "validatePaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestValidationRequest::class.java,
                    result,
                    gson
                )?.apply {
                    Validator.validate(result, this)
                }
            }
            "validatePaymentProductFieldForPaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestFieldValidationRequest::class.java,
                    result,
                    gson
                )?.apply {
                    Validator.validate(result, this)
                }
            }
            "validatePaymentRequestForValidationRule" -> {
                call.getRequestOrReturnError(
                    PaymentRequestRuleValidationRequest::class.java,
                    result,
                    gson
                )?.apply {
                    Validator.validate(result, this)
                }
            }
            else -> result.notImplemented()
        }
    }
}