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

package com.worldline.connect.connect_sdk_client_flutter.masking

import com.google.gson.Gson
import com.worldline.connect.connect_sdk_client_flutter.getRequestOrReturnError
import com.worldline.connect.connect_sdk_client_flutter.masking.models.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class MaskingMethodCallHandler(private val gson: Gson)
    : MethodChannel.MethodCallHandler {
    companion object {
        private const val TAG = "MaskingMethodHandler"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "applyMaskForPaymentProductField" -> {
                call.getRequestOrReturnError(
                    PaymentProductFieldMaskRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val maskedValue = field.applyMask(value)
                    result.success(maskedValue)
                }
            }
            "removeMaskForPaymentProductField" -> {
                call.getRequestOrReturnError(
                    PaymentProductFieldMaskRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val unmaskedValue = field.removeMask(value)
                    result.success(unmaskedValue)
                }
            }
            "maskedValueForPaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestMaskedValueRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val maskedValue = request.getMaskedValue(fieldId)
                    result.success(maskedValue)
                }
            }
            "unmaskedValueForPaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestMaskedValueRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val unmaskedValue = request.getUnmaskedValue(fieldId)
                    result.success(unmaskedValue)
                }
            }
            "allMaskedValuesForPaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestAllMaskedValuesRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val allMaskedValues = gson.toJson(request.maskedValues)
                    result.success(allMaskedValues)
                }
            }
            "allUnmaskedValuesForPaymentRequest" -> {
                call.getRequestOrReturnError(
                    PaymentRequestAllMaskedValuesRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val allUnmaskedValues = gson.toJson(request.unmaskedValues)
                    result.success(allUnmaskedValues)
                }
            }
            "maskedValueForAccountOnFile" -> {
                call.getRequestOrReturnError(
                    AccountOnFileMaskedValueRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val maskedValue = accountOnFile.getMaskedValue(fieldId)
                    result.success(maskedValue)
                }
            }
            "customMaskedValueForAccountOnFile" -> {
                call.getRequestOrReturnError(
                    AccountOnFileCustomMaskedValueRequest::class.java,
                    result,
                    gson
                )?.apply {
                    val customMaskedValue = accountOnFile.getMaskedValue(fieldId, mask)
                    result.success(customMaskedValue)
                }
            }
            else -> result.notImplemented()
        }
    }
}