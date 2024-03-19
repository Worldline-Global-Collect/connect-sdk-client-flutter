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

part of '../../connect_sdk.dart';

/// Implementation of the Client to Server API interface.
///
/// All methods that execute an API call have the following arguments:
/// ```dart
/// required void Function(T data) onSuccess
/// required void Function(ApiErrorResponse apiError) onApiError
/// required void Function(NativeException exception) onFailure
/// ```
///
/// These act as callback functions for the different outcomes of the API call and are wrapped in a [_NativeFutureListener] instance.
/// [_NativeFutureListener.success] will be triggered if the API was executed successfully, providing the relevant `data` object if applicable.
/// [_NativeFutureListener.apiError] will be triggered if the API call was not executed successfully or returned an unsuccessful response. Details of the error are provided in the [ApiErrorResponse] `apiError` supplied to the callback.
/// [_NativeFutureListener.failure] will be triggered if an exception occurred outside of the API call scope. Additional details are provided in the [NativeException] `exception` supplied to the callback.
class ClientApi {
  final _ClientApiCommunicator _communicator = _ClientApiCommunicator();
  final ConnectSDKConfiguration connectSDKConfiguration;

  ClientApi(this.connectSDKConfiguration)
      : assert(
            connectSDKConfiguration
                .sessionConfiguration.clientSessionId.isNotEmpty,
            "Missing clientSessionId"),
        assert(
            connectSDKConfiguration.sessionConfiguration.customerId.isNotEmpty,
            "Missing customerId"),
        assert(
            connectSDKConfiguration
                .sessionConfiguration.clientApiUrl.isNotEmpty,
            "Missing clientApiUrl"),
        assert(connectSDKConfiguration.sessionConfiguration.assetUrl.isNotEmpty,
            "Missing assetUrl");

  /// Retrieves the [BasicPaymentProducts] from the Connect Gateway.
  getPaymentProducts(
      {required void Function(BasicPaymentProducts basicPaymentProducts)
          onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    return _communicator
        .getBasicPaymentProducts(_NativeFutureListener(
            success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [PaymentProduct] as identified by the provided [paymentProductId] from the Connect Gateway.
  getPaymentProduct(
      {required String paymentProductId,
      required void Function(PaymentProduct paymentProduct) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = PaymentProductRequest(productId: paymentProductId);
    return _communicator
        .getPaymentProduct(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [BasicPaymentProductGroups] from the Connect Gateway.
  getPaymentProductGroups(
      {required void Function(
              BasicPaymentProductGroups basicPaymentProductGroups)
          onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    return _communicator
        .getBasicPaymentProductGroups(_NativeFutureListener(
            success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [PaymentProductGroup] as identified by the provided [paymentProductGroupId] from the Connect Gateway.
  getPaymentProductGroup(
      {required String paymentProductGroupId,
      required void Function(PaymentProductGroup) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = PaymentProductGroupRequest(
        paymentProductGroupId: paymentProductGroupId);
    return _communicator
        .getPaymentProductGroup(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [BasicPaymentItems] from the Connect Gateway.
  getPaymentItems(
      {required void Function(BasicPaymentItems) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    return _communicator
        .getPaymentItems(_NativeFutureListener(
            success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [PaymentProductDirectory] associated to the provided [paymentProductId] from the Connect Gateway.
  getPaymentProductDirectory(
      {required String paymentProductId,
      required void Function(PaymentProductDirectory) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = PaymentProductDirectoryRequest(productId: paymentProductId);
    return _communicator
        .getPaymentProductDirectory(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  getPrivacyPolicy(
      {String? paymentProductId,
      String? locale,
      required void Function(PrivacyPolicyResponse privacyPolicyResponse) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = PrivacyPolicyRequest(
        paymentProductId: paymentProductId, locale: locale);
    return _communicator
        .getPrivacyPolicy(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [IinDetailsResponse] for the provided [partialCreditCardNumber] from the Connect Gateway.
  getIINDetails(
      {required String partialCreditCardNumber,
      required void Function(IinDetailsResponse iinDetailsResponse) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request =
        IinDetailsRequest(partialCreditCardNumber: partialCreditCardNumber);
    return _communicator
        .getIINDetails(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [PublicKey] from the Connect Gateway.
  getPublicKey(
      {required void Function(PublicKey publicKey) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    return _communicator
        .getPublicKey(_NativeFutureListener(
            success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the [ThirdPartyStatusResponse] for the provided [paymentId] from the Connect Gateway.
  getThirdPartyStatus(
      {required String paymentId,
      required void Function(ThirdPartyStatusResponse) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = ThirdPartyStatusRequest(paymentId);
    return _communicator
        .getThirdPartyStatus(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the  [ConvertedAmount] for the provided input from the Connect Gateway.
  /// The Connect Gateway will convert the provided [amount] from its original currency [source] to the new currency [target].
  ///
  /// [source] and [target] should both be formatted as the 3 letter ISO Currency Code
  /// [amount] is an `int` that represents the amount to be converted in cents and always having 2 decimals.
  convertAmount(
      {required String source,
      required String target,
      required int amount,
      required void Function(ConvertedAmount) onSuccess,
      required void Function(ApiErrorResponse apiError) onApiError,
      required void Function(NativeException e) onFailure}) {
    final request = ConvertAmountRequest(source, target, amount);
    return _communicator
        .convertAmount(
            request,
            _NativeFutureListener(
                success: onSuccess, apiError: onApiError, failure: onFailure))
        .awaitJob();
  }

  /// Retrieves the logo for a payment product or payment product group based on the [logoUrl] using [Image.network].
  ///
  /// It provides all the same optional arguments as [Image.network] except for the `headers` argument.
  /// The url used to retrieve the logo is a combination of [SessionConfiguration.assetUrl] and the provided [logoUrl]
  Image retrieveLogo(String logoUrl,
      {Key? key,
      double scale = 1.0,
      ImageFrameBuilder? frameBuilder,
      ImageLoadingBuilder? loadingBuilder,
      ImageErrorWidgetBuilder? errorBuilder,
      String? semanticLabel,
      bool excludeFromSemantics = false,
      double? width,
      double? height,
      Color? color,
      Animation<double>? opacity,
      BlendMode? colorBlendMode,
      BoxFit? fit,
      AlignmentGeometry alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat,
      Rect? centerSlice,
      bool matchTextDirection = false,
      bool gaplessPlayback = false,
      FilterQuality filterQuality = FilterQuality.low,
      bool isAntiAlias = false,
      int? cacheWidth,
      int? cacheHeight}) {
    final Map<String, String> headers = {
      "Authorization":
          "GCS v1Client:${connectSDKConfiguration.sessionConfiguration.clientSessionId}",
    };

    String url = connectSDKConfiguration.sessionConfiguration.assetUrl;
    if (url.endsWith("/")) {
      url = "$url$logoUrl";
    } else {
      url = "$url/$logoUrl";
    }

    return Image.network(
      url,
      key: key,
      scale: scale,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      isAntiAlias: isAntiAlias,
      headers: headers,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
    );
  }
}
