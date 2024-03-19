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

import 'dart:convert';
import 'dart:io';

import 'package:connect_sdk_client_flutter/connect_sdk.dart';
import 'package:connect_sdk_client_flutter/src/model/requests/requests.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'sdk_test_initializer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ClientApi clientApi;
  const MethodChannel mockChannel = MethodChannel('client_api_channel');

  void success() {
    expect(true, true);
  }

  Map<String, dynamic> jsonMap(String filename) {
    final file = File(filename);
    return jsonDecode(file.readAsStringSync());
  }

  String jsonString(NativeSdkResult result) {
    final json = result.toJson((value) => value.toJson());
    return jsonEncode(json);
  }

  setUp(() async {
    // Initialize the SDK
    await SDKTestInitializer.initializeConnectSDK();
    clientApi = SDKTestInitializer.connectSDK.getClientApi();

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      mockChannel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case "getPublicKey":
            final PublicKey publicKey = PublicKey.fromJson(
                jsonMap("test/mock_responses/public_key_response.json"));
            return jsonString(NativeSdkResult(publicKey, null, null));
          case "getBasicPaymentProducts":
            final BasicPaymentProducts basicPaymentProducts =
                BasicPaymentProducts.fromJson(jsonMap(
                    "test/mock_responses/basic_payment_products_response.json"));
            return jsonString(
                NativeSdkResult(basicPaymentProducts, null, null));
          case "getPaymentProduct":
            final PaymentProduct paymentProduct = PaymentProduct.fromJson(
                jsonMap("test/mock_responses/payment_product_response.json"));
            return jsonString(NativeSdkResult(paymentProduct, null, null));
          case "getBasicPaymentProductGroups":
            final BasicPaymentProductGroups basicPaymentProductGroups =
                BasicPaymentProductGroups.fromJson(jsonMap(
                    "test/mock_responses/basic_payment_product_groups_response.json"));
            return jsonString(
                NativeSdkResult(basicPaymentProductGroups, null, null));
          case "getPaymentProductGroup":
            final PaymentProductGroup paymentProductGroup =
                PaymentProductGroup.fromJson(jsonMap(
                    "test/mock_responses/payment_product_group_response.json"));
            return jsonString(NativeSdkResult(paymentProductGroup, null, null));
          case "getPaymentItems":
            final BasicPaymentItems basicPaymentItems =
                BasicPaymentItems.fromJson(jsonMap(
                    "test/mock_responses/basic_payment_items_response.json"));
            return jsonString(NativeSdkResult(basicPaymentItems, null, null));
          case "getPaymentProductDirectory":
            final PaymentProductDirectory paymentProductDirectory =
                PaymentProductDirectory.fromJson(jsonMap(
                    "test/mock_responses/payment_product_directory_response.json"));
            return jsonString(
                NativeSdkResult(paymentProductDirectory, null, null));
          case "getIinDetails":
            final IinDetailsResponse iinDetails = IinDetailsResponse.fromJson(
                jsonMap("test/mock_responses/iin_details_response.json"));
            return jsonString(NativeSdkResult(iinDetails, null, null));
          case "getThirdPartyStatus":
            final ThirdPartyStatusResponse thirdPartyStatusResponse =
                ThirdPartyStatusResponse.fromJson(jsonMap(
                    "test/mock_responses/third_party_status_response.json"));
            return jsonString(
                NativeSdkResult(thirdPartyStatusResponse, null, null));
          case "convertAmount":
            final ConvertedAmount convertedAmount = ConvertedAmount.fromJson(
                jsonMap("test/mock_responses/converted_amount_response.json"));
            return jsonString(NativeSdkResult(convertedAmount, null, null));
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mockChannel, null);
  });

  test('getPublicKey', () async {
    await clientApi.getPublicKey(onSuccess: (response) {
      success();
    }, onApiError: (apiError) {
      fail(
          "apiError occurred when retrieving PublicKey: ${apiError.errors.first.message}");
    }, onFailure: (throwable) {
      fail("throwable occurred when retrieving PublicKey: ${throwable.error}");
    });
  });

  test('getBasicPaymentProducts', () async {
    await clientApi.getPaymentProducts(onSuccess: (response) {
      success();
    }, onApiError: (apiError) {
      fail(
          "apiError occurred when retrieving BasicPaymentProducts: ${apiError.errors.first.message}");
    }, onFailure: (throwable) {
      fail(
          "throwable occurred when retrieving BasicPaymentProducts: ${throwable.error}");
    });
  });

  test('getPaymentProduct', () async {
    await clientApi.getPaymentProduct(
        paymentProductId: "3",
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving PaymentProduct: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving PaymentProduct: ${throwable.error}");
        });
  });

  test('getBasicPaymentProductGroups', () async {
    await clientApi.getPaymentProductGroups(onSuccess: (response) {
      success();
    }, onApiError: (apiError) {
      fail(
          "apiError occurred when retrieving BasicPaymentProductGroups: ${apiError.errors.first.message}");
    }, onFailure: (throwable) {
      fail(
          "throwable occurred when retrieving BasicPaymentProductGroups: ${throwable.error}");
    });
  });

  test('getPaymentProductGroup', () async {
    await clientApi.getPaymentProductGroup(
        paymentProductGroupId: "cards",
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving PaymentProductGroup: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving PaymentProductGroup: ${throwable.error}");
        });
  });

  test('getPaymentItems', () async {
    await clientApi.getPaymentItems(onSuccess: (response) {
      success();
    }, onApiError: (apiError) {
      fail(
          "apiError occurred when retrieving BasicPaymentItems: ${apiError.errors.first.message}");
    }, onFailure: (throwable) {
      fail(
          "throwable occurred when retrieving BasicPaymentItems: ${throwable.error}");
    });
  });

  test('getPaymentProductDirectory', () async {
    await clientApi.getPaymentProductDirectory(
        paymentProductId: "809",
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving PaymentProductDirectory: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving PaymentProductDirectory: ${throwable.error}");
        });
  });

  test('getIinDetails', () async {
    await clientApi.getIINDetails(
        partialCreditCardNumber: "401200",
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving IinDetailsResponse: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving IinDetailsResponse: ${throwable.error}");
        });
  });

  test('getThirdPartyStatus', () async {
    await clientApi.getThirdPartyStatus(
        paymentId: "123456789",
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving ThirdPartyStatus: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving ThirdPartyStatus: ${throwable.error}");
        });
  });

  test('convertAmount', () async {
    await clientApi.convertAmount(
        source: "EUR",
        target: "GBP",
        amount: 100,
        onSuccess: (response) {
          success();
        },
        onApiError: (apiError) {
          fail(
              "apiError occurred when retrieving ConvertedAmount: ${apiError.errors.first.message}");
        },
        onFailure: (throwable) {
          fail(
              "throwable occurred when retrieving ConvertedAmount: ${throwable.error}");
        });
  });
}
