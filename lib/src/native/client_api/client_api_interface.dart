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

abstract class _ClientApiInterface extends PlatformInterface {
  /// Constructs a ConnectSdkClientFlutterPlatform.
  _ClientApiInterface() : super(token: _token);

  static final Object _token = Object();

  static final _ClientApiInterface _instance = _ClientApiChannel();

  /// The default instance of [_ClientApiInterface] to use.
  ///
  /// Defaults to [ClientApiChannel].
  static _ClientApiInterface get instance => _instance;

  Future<String> getPublicKey() {
    throw UnimplementedError('getPublicKey() has not been implemented.');
  }

  Future<String> getPaymentProducts() {
    throw UnimplementedError('getPaymentProducts() has not been implemented.');
  }

  Future<String> getPaymentProduct(String request) {
    throw UnimplementedError('getPaymentProduct() has not been implemented.');
  }

  Future<String> getPaymentProductGroups() {
    throw UnimplementedError(
        'getPaymentProductGroups() has not been implemented.');
  }

  Future<String> getPaymentProductGroup(String request) {
    throw UnimplementedError(
        'getPaymentProductGroup() has not been implemented.');
  }

  Future<String> getPaymentItems() {
    throw UnimplementedError('getPaymentItems() has not been implemented.');
  }

  Future<String> getPaymentProductDirectory(String request) {
    throw UnimplementedError(
        'getPaymentProductDirectory() has not been implemented.');
  }

  Future<String> getPrivacyPolicy(String request) {
    throw UnimplementedError('getPrivacyPolicy() has not been implemented.');
  }

  Future<String> getIINDetails(String request) {
    throw UnimplementedError('getIINDetails() has not been implemented.');
  }

  Future<String> getThirdPartyStatus(String request) {
    throw UnimplementedError('getThirdPartyStatus() has not been implemented.');
  }

  Future<String> convertAmount(String request) {
    throw UnimplementedError('convertAmount() has not been implemented.');
  }
}
