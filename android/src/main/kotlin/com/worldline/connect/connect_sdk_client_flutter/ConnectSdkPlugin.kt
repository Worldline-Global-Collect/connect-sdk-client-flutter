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

package com.worldline.connect.connect_sdk_client_flutter

import com.google.gson.GsonBuilder
import com.worldline.connect.sdk.client.android.model.validation.AbstractValidationRule
import com.worldline.connect.connect_sdk_client_flutter.adapters.ValidationRuleTypeAdapter
import com.worldline.connect.connect_sdk_client_flutter.client_api.ClientApiMethodCallHandler
import com.worldline.connect.connect_sdk_client_flutter.connect_sdk.ConnectSDKMethodCallHandler
import com.worldline.connect.connect_sdk_client_flutter.masking.MaskingMethodCallHandler
import com.worldline.connect.connect_sdk_client_flutter.validation.ValidationMethodCallHandler

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import java.lang.ref.WeakReference

/** ConnectSdkClientFlutterPlugin */
class ConnectSdkPlugin: FlutterPlugin {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var connectSDKChannel : MethodChannel
  private lateinit var clientApiChannel : MethodChannel
  private lateinit var maskingChannel : MethodChannel
  private lateinit var validationChannel : MethodChannel

  private val clientApiChannelName = "client_api_channel"
  private val connectSDKChannelName = "connect_sdk_channel"
  private val validationChannelName = "validation_channel"
  private val maskingChannelName = "masking_channel"

  private val gson = GsonBuilder()
    .registerTypeAdapter(AbstractValidationRule::class.java, ValidationRuleTypeAdapter())
    .create()

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val contextReference = WeakReference(flutterPluginBinding.applicationContext)

    connectSDKChannel = MethodChannel(flutterPluginBinding.binaryMessenger, connectSDKChannelName)
    connectSDKChannel.setMethodCallHandler(ConnectSDKMethodCallHandler(contextReference, gson))

    clientApiChannel = MethodChannel(flutterPluginBinding.binaryMessenger, clientApiChannelName)
    clientApiChannel.setMethodCallHandler(ClientApiMethodCallHandler(gson))

    maskingChannel = MethodChannel(flutterPluginBinding.binaryMessenger, maskingChannelName)
    maskingChannel.setMethodCallHandler(MaskingMethodCallHandler(gson))

    validationChannel = MethodChannel(flutterPluginBinding.binaryMessenger, validationChannelName)
    validationChannel.setMethodCallHandler(ValidationMethodCallHandler(gson))
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    connectSDKChannel.setMethodCallHandler(null)
    clientApiChannel.setMethodCallHandler(null)
    maskingChannel.setMethodCallHandler(null)
    validationChannel.setMethodCallHandler(null)
  }
}
