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

import 'package:flutter_test/flutter_test.dart';
import 'package:connect_sdk_client_flutter/connect_sdk.dart';

void main() {
  Future<Map<String, dynamic>> jsonMap(String filename) async {
    final file = File(filename);
    return jsonDecode(await file.readAsString());
  }

  test('deserializePublicKey', () async {
    final PublicKey deserializedPublicKey = PublicKey.fromJson(
        await jsonMap("test/mock_responses/public_key_response.json"));

    expect(deserializedPublicKey.keyId, "TestKeyId");
    expect(deserializedPublicKey.publicKey, "t3stP0bl1cK3y");
  });

  test('deserializeBasicPaymentProducts', () async {
    final BasicPaymentProducts deserializedBasicPaymentProducts =
        BasicPaymentProducts.fromJson(await jsonMap(
            "test/mock_responses/basic_payment_products_response.json"));

    expect(deserializedBasicPaymentProducts.products.length, 3);
    final product = deserializedBasicPaymentProducts.products[0];

    expect(product.accountsOnFile.length, 0);
    expect(product.acquirerCountry, "NL");
    expect(product.allowsInstallments, false);
    expect(product.allowsRecurring, true);
    expect(product.allowsTokenization, true);
    expect(product.authenticationIndicator, isNull);
    expect(product.autoTokenized, false);
    expect(product.deviceFingerprintEnabled, false);
    expect(product.displayHints.displayOrder, 0);
    expect(product.displayHints.label, "American Express");
    expect(product.displayHints.logoUrl, "American_Express_logo");
    expect(product.id, "2");
    expect(product.maxAmount, isNull);
    expect(product.minAmount, isNull);
    expect(product.mobileIntegrationLevel, MobileIntegrationLevel.noSupport);
    expect(product.paymentMethod, "card");
    expect(product.paymentProduct320SpecificData, isNull);
    expect(product.paymentProduct302SpecificData, isNull);
    expect(product.paymentProduct863SpecificData, isNull);
    expect(product.paymentProductGroup, "Cards");
    expect(product.usesRedirectionTo3rdParty, false);
    expect(product.supportsMandates, true);
  });

  test('deserializePaymentProductWithAccountOnFile', () async {
    final PaymentProduct deserializedPaymentProduct = PaymentProduct.fromJson(
        await jsonMap("test/mock_responses/payment_product_response.json"));

    expect(deserializedPaymentProduct.acquirerCountry, "NL");
    expect(deserializedPaymentProduct.allowsInstallments, false);
    expect(deserializedPaymentProduct.allowsRecurring, true);
    expect(deserializedPaymentProduct.allowsTokenization, true);
    expect(deserializedPaymentProduct.authenticationIndicator, isNull);
    expect(deserializedPaymentProduct.autoTokenized, false);
    expect(deserializedPaymentProduct.deviceFingerprintEnabled, false);
    expect(deserializedPaymentProduct.displayHints.displayOrder, 0);
    expect(deserializedPaymentProduct.displayHints.label, "MasterCard");
    expect(deserializedPaymentProduct.displayHints.logoUrl, "MasterCard_logo");
    expect(deserializedPaymentProduct.id, "3");
    expect(deserializedPaymentProduct.maxAmount, isNull);
    expect(deserializedPaymentProduct.minAmount, isNull);
    expect(deserializedPaymentProduct.mobileIntegrationLevel, isNull);
    expect(deserializedPaymentProduct.paymentMethod, "card");
    expect(deserializedPaymentProduct.paymentProduct320SpecificData, isNull);
    expect(deserializedPaymentProduct.paymentProduct302SpecificData, isNull);
    expect(deserializedPaymentProduct.paymentProduct863SpecificData, isNull);
    expect(deserializedPaymentProduct.paymentProductGroup, "Cards");
    expect(deserializedPaymentProduct.usesRedirectionTo3rdParty, false);
    expect(deserializedPaymentProduct.supportsMandates, false);
    expect(deserializedPaymentProduct.displayHints.displayOrder, 0);
    expect(deserializedPaymentProduct.displayHints.label, "MasterCard");
    expect(deserializedPaymentProduct.displayHints.logoUrl, "MasterCard_logo");

    expect(deserializedPaymentProduct.accountsOnFile.length, 1);
    final accountOnFile = deserializedPaymentProduct.accountsOnFile[0];
    expect(accountOnFile.attributes.length, 4);
    expect(accountOnFile.attributes[0].key, "cardholderName");
    expect(accountOnFile.attributes[0].value, "Wile E. Coyote");
    expect(accountOnFile.attributes[0].status,
        AccountOnFileAttributeStatus.readOnly);
    expect(accountOnFile.attributes[0].mustWriteReason, isNull);
    expect(accountOnFile.attributes[2].key, "cvv");
    expect(accountOnFile.attributes[2].value, "111");
    expect(accountOnFile.attributes[2].status,
        AccountOnFileAttributeStatus.canWrite);
    expect(accountOnFile.attributes[2].mustWriteReason, isNull);
    expect(accountOnFile.displayHints.labelTemplate.length, 1);
    expect(accountOnFile.displayHints.labelTemplate[0].attributeKey, "alias");
    expect(accountOnFile.displayHints.labelTemplate[0].mask,
        "{{9999}} {{9999}} {{9999}} {{9999}} {{999}}");
    expect(accountOnFile.displayHints.logo, "aof_logo");
    expect(accountOnFile.id, "0");
    expect(accountOnFile.paymentProductId, "3");

    expect(deserializedPaymentProduct.fields.length, 4);
    final paymentProductField = deserializedPaymentProduct.fields[0];
    expect(paymentProductField.dataRestrictions.isRequired, true);
    expect(paymentProductField.displayHints?.alwaysShow, false);
    expect(paymentProductField.displayHints?.displayOrder, 0);
    expect(paymentProductField.displayHints?.label, "Card number");
    expect(paymentProductField.displayHints?.mask,
        "{{9999}} {{9999}} {{9999}} {{9999}} {{999}}");
    expect(paymentProductField.displayHints?.obfuscate, false);
    expect(paymentProductField.displayHints?.placeholderLabel, "");
    expect(paymentProductField.displayHints?.preferredInputType,
        PreferredInputType.stringKeyboard);
    expect(paymentProductField.displayHints?.tooltip?.label, "");
    expect(paymentProductField.id, "cardNumber");
    expect(paymentProductField.type, PaymentProductFieldType.numericString);

    expect(paymentProductField.displayHints?.formElement?.type,
        FormElementType.list);
    expect(
        paymentProductField.displayHints?.formElement?.valueMapping?.length, 1);
    final valueMappingItem =
        paymentProductField.displayHints?.formElement?.valueMapping;
    expect(valueMappingItem?[0].value, "valueMappingValue");
    expect(valueMappingItem?[0].displayElements.length, 1);
    final displayElement = valueMappingItem?[0].displayElements[0];
    expect(displayElement?.id, "1");
    expect(displayElement?.value, "MasterCard");
    expect(displayElement?.type, PaymentProductFieldDisplayElementType.string);

    expect(paymentProductField.dataRestrictions.validationRules.length, 3);
    final validationRuleLength = paymentProductField
        .dataRestrictions.validationRules[0] as ValidationRuleLength;
    expect(validationRuleLength.validationType, ValidationType.length);
    expect(validationRuleLength.minLength, 13);
    expect(validationRuleLength.maxLength, 19);
  });

  test('deserializePaymentProductGooglePay', () async {
    final PaymentProduct deserializedPaymentProduct = PaymentProduct.fromJson(
        await jsonMap(
            "test/mock_responses/payment_product_response_googlepay.json"));

    expect(deserializedPaymentProduct.acquirerCountry, "US");
    expect(deserializedPaymentProduct.allowsInstallments, false);
    expect(deserializedPaymentProduct.allowsRecurring, false);
    expect(deserializedPaymentProduct.allowsTokenization, false);
    expect(deserializedPaymentProduct.authenticationIndicator, isNull);
    expect(deserializedPaymentProduct.autoTokenized, false);
    expect(deserializedPaymentProduct.deviceFingerprintEnabled, false);
    expect(deserializedPaymentProduct.displayHints.displayOrder, 0);
    expect(deserializedPaymentProduct.displayHints.label, "GOOGLEPAY");
    expect(deserializedPaymentProduct.displayHints.logoUrl, "GOOGLEPAY_logo");
    expect(deserializedPaymentProduct.id, "320");
    expect(deserializedPaymentProduct.maxAmount, isNull);
    expect(deserializedPaymentProduct.minAmount, isNull);
    expect(deserializedPaymentProduct.mobileIntegrationLevel, isNull);
    expect(deserializedPaymentProduct.paymentMethod, "mobile");
    expect(deserializedPaymentProduct.paymentProduct302SpecificData, isNull);
    expect(deserializedPaymentProduct.paymentProduct863SpecificData, isNull);
    expect(deserializedPaymentProduct.paymentProductGroup, isNull);
    expect(deserializedPaymentProduct.usesRedirectionTo3rdParty, false);
    expect(deserializedPaymentProduct.supportsMandates, false);

    final paymentProduct320SpecificData =
        deserializedPaymentProduct.paymentProduct320SpecificData;
    expect(paymentProduct320SpecificData?.networks.length, 2);
    expect(paymentProduct320SpecificData?.networks[0], "VISA");
    expect(paymentProduct320SpecificData?.networks[1], "MASTERCARD");
    expect(paymentProduct320SpecificData?.gateway, "googlepaygateway");

    expect(deserializedPaymentProduct.fields.length, 2);
    final paymentProductField = deserializedPaymentProduct.fields[0];
    expect(paymentProductField.dataRestrictions.isRequired, true);
    expect(paymentProductField.dataRestrictions.validationRules.length, 0);
    expect(paymentProductField.displayHints, null);
    expect(paymentProductField.id, "encryptedPaymentData");
    expect(paymentProductField.type, PaymentProductFieldType.string);
  });

  test('deserializeBasicPaymentProductGroups', () async {
    final BasicPaymentProductGroups deserializedBasicPaymentProductGroups =
        BasicPaymentProductGroups.fromJson(await jsonMap(
            "test/mock_responses/basic_payment_product_groups_response.json"));

    expect(
        deserializedBasicPaymentProductGroups.basicPaymentProductGroups.length,
        2);
    final basicPaymentProductGroup =
        deserializedBasicPaymentProductGroups.basicPaymentProductGroups[0];

    expect(basicPaymentProductGroup.deviceFingerprintEnabled, true);
    expect(basicPaymentProductGroup.accountsOnFile.length, 0);
    expect(basicPaymentProductGroup.allowsInstallments, false);
    expect(basicPaymentProductGroup.displayHints.displayOrder, 1);
    expect(basicPaymentProductGroup.displayHints.label, "Cards");
    expect(basicPaymentProductGroup.displayHints.logoUrl, "cards_logo");
    expect(basicPaymentProductGroup.id, "cards");
  });

  test('deserializePaymentProductGroup', () async {
    final PaymentProductGroup deserializedPaymentProductGroup =
        PaymentProductGroup.fromJson(await jsonMap(
            "test/mock_responses/payment_product_group_response.json"));

    expect(deserializedPaymentProductGroup.deviceFingerprintEnabled, true);
    expect(deserializedPaymentProductGroup.accountsOnFile.length, 0);
    expect(deserializedPaymentProductGroup.allowsInstallments, false);
    expect(deserializedPaymentProductGroup.displayHints.displayOrder, 1);
    expect(deserializedPaymentProductGroup.displayHints.label, "Cards");
    expect(deserializedPaymentProductGroup.displayHints.logoUrl, "cards_logo");
    expect(deserializedPaymentProductGroup.id, "cards");

    expect(deserializedPaymentProductGroup.fields.length, 4);
    final paymentProductField = deserializedPaymentProductGroup.fields[0];
    expect(paymentProductField.dataRestrictions.isRequired, true);
    expect(paymentProductField.displayHints?.alwaysShow, false);
    expect(paymentProductField.displayHints?.displayOrder, 0);
    expect(paymentProductField.displayHints?.label, "Card number");
    expect(paymentProductField.displayHints?.mask,
        "{{9999}} {{9999}} {{9999}} {{9999}} {{999}}");
    expect(paymentProductField.displayHints?.obfuscate, false);
    expect(paymentProductField.displayHints?.placeholderLabel,
        "**** **** **** ****");
    expect(paymentProductField.displayHints?.preferredInputType,
        PreferredInputType.integerKeyboard);
    expect(paymentProductField.displayHints?.tooltip, isNull);
    expect(paymentProductField.id, "cardNumber");
    expect(paymentProductField.type, PaymentProductFieldType.numericString);

    expect(paymentProductField.dataRestrictions.validationRules.length, 2);
    final validationRuleLength = paymentProductField
        .dataRestrictions.validationRules[0] as ValidationRuleLength;
    expect(validationRuleLength.validationType, ValidationType.length);
    expect(validationRuleLength.minLength, 12);
    expect(validationRuleLength.maxLength, 19);
  });

  test('deserializeBasicPaymentItems', () async {
    final BasicPaymentItems deserializedBasicPaymentItems =
        BasicPaymentItems.fromJson(await jsonMap(
            "test/mock_responses/basic_payment_items_response.json"));

    expect(deserializedBasicPaymentItems.accountsOnFile.length, 0);
    expect(deserializedBasicPaymentItems.basicPaymentItems.length, 5);

    final basicPaymentItem = deserializedBasicPaymentItems.basicPaymentItems[0];
    expect(basicPaymentItem.getAccountsOnFile().length, 0);
    expect(basicPaymentItem.getAcquirerCountry(), "NL");
    expect(basicPaymentItem.getId(), "2");
    expect(basicPaymentItem.getDisplayHints()?.displayOrder, 0);
    expect(basicPaymentItem.getDisplayHints()?.label, "American Express");
    expect(
        basicPaymentItem.getDisplayHints()?.logoUrl, "American_Express_logo");
  });

  test('deserializePaymentProductDirectory', () async {
    final PaymentProductDirectory deserializedPaymentProductDirectory =
        PaymentProductDirectory.fromJson(await jsonMap(
            "test/mock_responses/payment_product_directory_response.json"));

    expect(deserializedPaymentProductDirectory.entries.length, 2);
    final paymentProductDirectoryEntry =
        deserializedPaymentProductDirectory.entries[0];
    expect(paymentProductDirectoryEntry.countryNames.length, 1);
    expect(paymentProductDirectoryEntry.countryNames[0], "Netherlands");
    expect(paymentProductDirectoryEntry.issuerId, "BANKNL");
    expect(paymentProductDirectoryEntry.issuerList, "short");
    expect(paymentProductDirectoryEntry.issuerName, "TEST iDEAL issuer");
  });

  test('deserializeIinDetailsResponse', () async {
    final IinDetailsResponse deserializedIinDetailsResponse =
        IinDetailsResponse.fromJson(
            await jsonMap("test/mock_responses/iin_details_response.json"));

    expect(deserializedIinDetailsResponse.status, IinStatus.supported);
    expect(deserializedIinDetailsResponse.coBrands.length, 2);
    expect(deserializedIinDetailsResponse.coBrands[0].isAllowedInContext, true);
    expect(deserializedIinDetailsResponse.coBrands[0].paymentProductId, "3");
    expect(
        deserializedIinDetailsResponse.coBrands[1].isAllowedInContext, false);
    expect(deserializedIinDetailsResponse.coBrands[1].paymentProductId, "119");
    expect(deserializedIinDetailsResponse.countryCode, "US");
    expect(deserializedIinDetailsResponse.isAllowedInContext, true);
    expect(deserializedIinDetailsResponse.paymentProductId, "3");
  });

  test('deserializeThirdPartyStatusResponse', () async {
    final ThirdPartyStatusResponse deserializedThirdPartyStatusResponse =
        ThirdPartyStatusResponse.fromJson(await jsonMap(
            "test/mock_responses/third_party_status_response.json"));

    expect(deserializedThirdPartyStatusResponse.thirdPartyStatus,
        ThirdPartyStatus.initialized);
  });

  test('deserializeConvertedAmount', () async {
    final ConvertedAmount deserializedConvertedAmount =
        ConvertedAmount.fromJson(await jsonMap(
            "test/mock_responses/converted_amount_response.json"));

    expect(deserializedConvertedAmount.convertedAmount, 87);
  });

  test('deserializePreparedPaymentRequest', () async {
    final EncryptedPaymentRequest deserializedEncryptedPaymentRequest =
        EncryptedPaymentRequest.fromJson(await jsonMap(
            "test/mock_responses/encrypted_payment_request.json"));

    expect(deserializedEncryptedPaymentRequest.encryptedFields,
        "A1B2C3encryptedFieldsD4E5F6");
    expect(deserializedEncryptedPaymentRequest.encodedClientMetaInfo,
        "A1B2C3encodedClientMetaInfoD4E5F6");
  });
}
