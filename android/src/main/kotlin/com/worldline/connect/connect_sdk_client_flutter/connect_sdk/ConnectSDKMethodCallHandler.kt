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

package com.worldline.connect.connect_sdk_client_flutter.connect_sdk

import android.content.Context
import com.google.gson.Gson
import com.worldline.connect.sdk.client.android.configuration.ConnectSDKConfiguration
import com.worldline.connect.sdk.client.android.configuration.PaymentConfiguration
import com.worldline.connect.connect_sdk_client_flutter.getRequestOrReturnError
import com.worldline.connect.connect_sdk_client_flutter.connect_sdk.models.*
import com.worldline.connect.connect_sdk_client_flutter.client_api.models.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.lang.ref.WeakReference

class ConnectSDKMethodCallHandler(private val contextReference: WeakReference<Context>, private val gson: Gson)
    : MethodChannel.MethodCallHandler {
    companion object {
        private const val TAG = "ConnectSDKMethodHandler"
    }

    private val applicationContext get() = contextReference.get()

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "initialize" -> initializeConnectSDK(call, result)
            "encryptPaymentRequest" -> encryptPaymentRequest(call, result)
            else -> result.notImplemented()
        }
    }

    private fun initializeConnectSDK(call: MethodCall, result: MethodChannel.Result) {
        val context = applicationContext ?: return ResultError.missingContext(result)
        val requestWithoutContext = call.getRequestOrReturnError(InitializeSDKWithoutContextRequest::class.java, result, gson)
        requestWithoutContext ?: return
        assertInitializationArguments(requestWithoutContext)?.let { missingArgument ->
            ResultError.missingInitializeSDKArgument(missingArgument, result)
            return@initializeConnectSDK
        }
        val request = createInitializeSDKRequestWithContext(context, requestWithoutContext.connectSdkConfiguration, requestWithoutContext.paymentConfiguration)
        ConnectSDKBridge.initializeConnectSDK(request)
        result.success(ConnectSDKBridge.isInitialized())
    }

    private fun createInitializeSDKRequestWithContext(context: Context, configurationWithoutContext: ConnectSDKConfigurationWithoutContext, paymentConfiguration: PaymentConfiguration) : InitializeSDKRequest {
        val connectSDKConfiguration = ConnectSDKConfiguration.Builder(
            sessionConfiguration = configurationWithoutContext.sessionConfiguration,
            applicationContext = context,
            enableNetworkLogs = configurationWithoutContext.enableNetworkLogs,
            applicationId = configurationWithoutContext.applicationId,
            ipAddress = configurationWithoutContext.ipAddress,
            preLoadImages = configurationWithoutContext.preLoadImages,
            sdkIdentifier = configurationWithoutContext.sdkIdentifier
        )
            .build()

        return InitializeSDKRequest(
            connectSDKConfiguration,
            paymentConfiguration
        )
    }

    private fun encryptPaymentRequest(call: MethodCall, result: MethodChannel.Result) {
        val request = call.getRequestOrReturnError(EncryptPaymentRequest::class.java, result, gson)
        request ?: return
        if (ConnectSDKBridge.isInitialized()) {
            ConnectSDKBridge.encryptPaymentRequest(result, request)
        }
    }
    private fun assertInitializationArguments(request: InitializeSDKWithoutContextRequest) : String? {
        val sessionConfig = request.connectSdkConfiguration.sessionConfiguration
        val paymentContext = request.paymentConfiguration.paymentContext

        val error = when {
            sessionConfig.clientSessionId.isBlank() -> "clientSessionId"
            sessionConfig.customerId.isBlank() -> "customerId"
            sessionConfig.clientApiUrl.isBlank() -> "clientApiUrl"
            sessionConfig.assetUrl.isBlank() -> "assetUrl"
            paymentContext.amountOfMoney.currencyCode.isBlank() -> "currencyCode"
            paymentContext.countryCode.isBlank() -> "countryCode"
            else -> null
        }
        return error

    }
}