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

class _ClientApiCommunicator {
  _NativeFuture<PublicKey> getPublicKey(
      _NativeFutureListener<PublicKey> listener) {
    return _NativeFuture(_ClientApiInterface.instance.getPublicKey(),
        (data) => PublicKey.fromJson(data as Map<String, dynamic>), listener);
  }

  _NativeFuture<PaymentProductGroup> getPaymentProductGroup(
      PaymentProductGroupRequest request,
      _NativeFutureListener<PaymentProductGroup> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentProductGroup(req),
        (data) => PaymentProductGroup.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<PaymentProduct> getPaymentProduct(PaymentProductRequest request,
      _NativeFutureListener<PaymentProduct> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentProduct(req),
        (data) => PaymentProduct.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<PrivacyPolicyResponse> getPrivacyPolicy(PrivacyPolicyRequest request,
      _NativeFutureListener<PrivacyPolicyResponse> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getPrivacyPolicy(req),
            (data) => PrivacyPolicyResponse.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<IinDetailsResponse> getIINDetails(IinDetailsRequest request,
      _NativeFutureListener<IinDetailsResponse> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getIINDetails(req),
        (data) => IinDetailsResponse.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<BasicPaymentItems> getPaymentItems(
      _NativeFutureListener<BasicPaymentItems> listener) {
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentItems(),
        (data) => BasicPaymentItems.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<PaymentProductDirectory> getPaymentProductDirectory(
      PaymentProductDirectoryRequest request,
      _NativeFutureListener<PaymentProductDirectory> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentProductDirectory(req),
        (data) =>
            PaymentProductDirectory.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<BasicPaymentProductGroups> getBasicPaymentProductGroups(
      _NativeFutureListener<BasicPaymentProductGroups> listener) {
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentProductGroups(),
        (data) =>
            BasicPaymentProductGroups.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<BasicPaymentProducts> getBasicPaymentProducts(
      _NativeFutureListener<BasicPaymentProducts> listener) {
    return _NativeFuture(
        _ClientApiInterface.instance.getPaymentProducts(),
        (data) => BasicPaymentProducts.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<ThirdPartyStatusResponse> getThirdPartyStatus(
      ThirdPartyStatusRequest request,
      _NativeFutureListener<ThirdPartyStatusResponse> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.getThirdPartyStatus(req),
        (data) =>
            ThirdPartyStatusResponse.fromJson(data as Map<String, dynamic>),
        listener);
  }

  _NativeFuture<ConvertedAmount> convertAmount(ConvertAmountRequest request,
      _NativeFutureListener<ConvertedAmount> listener) {
    final req = jsonEncode(request);
    return _NativeFuture(
        _ClientApiInterface.instance.convertAmount(req),
        (data) => ConvertedAmount.fromJson(data as Map<String, dynamic>),
        listener);
  }
}
