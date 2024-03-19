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

  late ConnectSDK connectSDK;
  const MethodChannel mockChannel = MethodChannel('connect_sdk_channel');

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
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      mockChannel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case "initialize":
            return true;
          case "encryptPaymentRequest":
            final EncryptedPaymentRequest encryptedPaymentRequest =
                EncryptedPaymentRequest.fromJson(jsonMap(
                    "test/mock_responses/encrypted_payment_request.json"));
            return jsonString(
                NativeSdkResult(encryptedPaymentRequest, null, null));
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mockChannel, null);
  });

  test('initialize', () async {
    await SDKTestInitializer.initializeConnectSDK();
    connectSDK = SDKTestInitializer.connectSDK;
    expect(
        connectSDK.initializationStatus, SdkInitializationStatus.initialized);
  });

  PaymentRequest createPaymentRequest() {
    final PaymentItemDisplayHints dummyDisplayHints =
        PaymentItemDisplayHints("VISA", displayOrder: 0, logoUrl: "VISA_logo");
    final PaymentProduct dummyPaymentProduct =
        PaymentProduct("1", "card", dummyDisplayHints);

    return PaymentRequest(paymentProduct: dummyPaymentProduct, tokenize: false);
  }

  test('preparePaymentRequest', () async {
    final request = SdkPreparePaymentRequest(createPaymentRequest());

    await connectSDK.encryptPaymentRequest(
        paymentRequest: request,
        onSuccess: (response) {
          success();
        },
        onFailure: (exception) {
          fail(
              "Exception occurred when encrypting PaymentRequest: ${exception.error}");
        });
  });
}
