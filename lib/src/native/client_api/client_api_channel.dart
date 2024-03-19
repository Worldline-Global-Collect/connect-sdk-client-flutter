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

class _ClientApiChannel extends _ClientApiInterface {
  /// The method channel used to interact with the native platform.
  final _methodChannel = const MethodChannel('client_api_channel');

  @override
  Future<String> getPublicKey() async {
    final result = await _methodChannel.invokeMethod('getPublicKey');
    return result;
  }

  @override
  Future<String> getPaymentProducts() async {
    final result = await _methodChannel.invokeMethod('getBasicPaymentProducts');
    return result;
  }

  @override
  Future<String> getPaymentProduct(String request) async {
    final result = await _methodChannel
        .invokeMethod('getPaymentProduct', {"request": request});
    return result;
  }

  @override
  Future<String> getPaymentProductGroups() async {
    final result =
        await _methodChannel.invokeMethod('getBasicPaymentProductGroups');
    return result;
  }

  @override
  Future<String> getPaymentProductGroup(String request) async {
    final result = await _methodChannel
        .invokeMethod('getPaymentProductGroup', {"request": request});
    return result;
  }

  @override
  Future<String> getPaymentItems() async {
    final result = await _methodChannel.invokeMethod('getPaymentItems');
    return result;
  }

  @override
  Future<String> getPaymentProductDirectory(String request) async {
    final result = await _methodChannel
        .invokeMethod('getPaymentProductDirectory', {"request": request});
    return result;
  }

  @override
  Future<String> getPrivacyPolicy(String request) async {
    final result = await _methodChannel
        .invokeMethod('getPrivacyPolicy', {"request": request});
    return result;
  }

  @override
  Future<String> getIINDetails(String request) async {
    final result = await _methodChannel
        .invokeMethod('getIinDetails', {"request": request});
    return result;
  }

  @override
  Future<String> getThirdPartyStatus(String request) async {
    final result = await _methodChannel
        .invokeMethod('getThirdPartyStatus', {"request": request});
    return result;
  }

  @override
  Future<String> convertAmount(String request) async {
    final result = await _methodChannel
        .invokeMethod('convertAmount', {"request": request});
    return result;
  }
}
