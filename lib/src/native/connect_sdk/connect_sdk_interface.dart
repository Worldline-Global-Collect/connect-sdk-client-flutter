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

abstract class _ConnectSDKInterface extends PlatformInterface {
  /// Constructs a ConnectSdkClientFlutterPlatform.
  _ConnectSDKInterface() : super(token: _token);

  static final Object _token = Object();

  static final _ConnectSDKInterface _instance = _ConnectSDKChannel();

  /// The default instance of [_ConnectSDKInterface] to use.
  ///
  /// Defaults to [_ConnectSDKInterface].
  static _ConnectSDKInterface get instance => _instance;

  Future<bool> initialize(String request) async {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<String> encryptPaymentRequest(String encryptPaymentRequest) async {
    throw UnimplementedError(
        'encryptPaymentRequest() has not been implemented.');
  }
}
