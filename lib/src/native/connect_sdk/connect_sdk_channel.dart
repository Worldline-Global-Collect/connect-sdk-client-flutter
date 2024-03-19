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

part of '../../../connect_sdk.dart';

/// An implementation of [ClientApiInterface] that uses method channels.

class _ConnectSDKChannel extends _ConnectSDKInterface {
  /// The method channel used to interact with the native platform.
  final _methodChannel = const MethodChannel('connect_sdk_channel');

  @override
  Future<bool> initialize(String request) async {
    final result =
        await _methodChannel.invokeMethod('initialize', {"request": request});
    return result;
  }

  @override
  Future<String> encryptPaymentRequest(String encryptPaymentRequest) async {
    final result = await _methodChannel.invokeMethod(
        'encryptPaymentRequest', {"request": encryptPaymentRequest});
    return result;
  }
}
