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

import com.google.gson.Gson
import com.google.gson.JsonSyntaxException
import com.worldline.connect.connect_sdk_client_flutter.client_api.models.ResultError
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

fun <T> MethodCall.getRequestOrReturnError(type: Class<T>, result: MethodChannel.Result, gson: Gson, argumentKey: String = "request") : T? {
    val json = argument<String>(argumentKey)
    return try {
        gson.fromJson(json, type)
    } catch (e: JsonSyntaxException) {
        ResultError.missingRequestArgument(type.simpleName, this, result)
        null
    }
}