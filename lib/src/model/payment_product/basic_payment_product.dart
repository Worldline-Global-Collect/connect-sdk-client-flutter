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

import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'basic_payment_product.g.dart';

/// Represents a BasicPaymentProduct object.
@JsonSerializable(explicitToJson: true)
class BasicPaymentProduct implements BasicPaymentItem {
  /// List of the known [AccountOnFile] for this payment product.
  @JsonKey()
  final List<AccountOnFile> accountsOnFile;

  /// The acquirer country for this payment product.
  @JsonKey()
  final String? acquirerCountry;

  /// Whether this product allows installments.
  @JsonKey()
  final bool allowsInstallments;

  /// Whether this product allows recurring payments.
  @JsonKey()
  final bool allowsRecurring;

  /// Whether this product allows tokenization.
  @JsonKey()
  final bool allowsTokenization;

  /// Indicates if the payment product support 3D security.
  @JsonKey()
  final AuthenticationIndicator? authenticationIndicator;

  /// Whether this product automatically tokenizes payment information.
  @JsonKey()
  final bool autoTokenized;

  /// Whether this product has device fingerprinting enabled.
  @JsonKey()
  final bool deviceFingerprintEnabled;

  /// The display hints for this payment product.
  @JsonKey(required: true)
  final PaymentItemDisplayHints displayHints;

  /// The identifier for this payment product.
  @JsonKey(required: true)
  final String id;

  /// The maximum amount this payment product allows for a payment, expressed as an amount in cents.
  @JsonKey()
  final int? maxAmount;

  /// The minimum amount this payment product allows for a payment, expressed as an amount in cents.
  @JsonKey()
  final int? minAmount;

  /// Indicator of the level of mobile support offered by this payment product.
  @JsonKey()
  final MobileIntegrationLevel? mobileIntegrationLevel;

  /// The name of the payment method for this payment product.
  @JsonKey()
  final String paymentMethod;

  /// ApplePay specific data, will only be returned on the ApplePay payment product.
  @JsonKey()
  final PaymentProduct302SpecificData? paymentProduct302SpecificData;

  /// GooglePay specific data, will only be returned on the GooglePay payment product.
  @JsonKey()
  final PaymentProduct320SpecificData? paymentProduct320SpecificData;

  /// WeChat Pay specific data, will only be returned on the WeChat Pay payment product.
  @JsonKey()
  final PaymentProduct863SpecificData? paymentProduct863SpecificData;

  /// The [PaymentProductGroup] that this payment product belongs to.
  @JsonKey()
  final String? paymentProductGroup;

  /// Whether this product uses a redirection to a 3rd party.
  @JsonKey()
  final bool usesRedirectionTo3rdParty;

  /// Whether this product supports mandates.
  @JsonKey()
  final bool supportsMandates;

  BasicPaymentProduct(this.id, this.paymentMethod, this.displayHints,
      {this.acquirerCountry = "",
      this.accountsOnFile = const [],
      this.allowsInstallments = false,
      this.allowsRecurring = false,
      this.allowsTokenization = false,
      this.authenticationIndicator,
      this.autoTokenized = false,
      this.deviceFingerprintEnabled = false,
      this.maxAmount,
      this.minAmount,
      this.mobileIntegrationLevel,
      this.paymentProduct302SpecificData,
      this.paymentProduct320SpecificData,
      this.paymentProduct863SpecificData,
      this.paymentProductGroup,
      this.usesRedirectionTo3rdParty = false,
      this.supportsMandates = false});

  factory BasicPaymentProduct.fromJson(Map<String, dynamic> json) =>
      _$BasicPaymentProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasicPaymentProductToJson(this);

  @override
  List<AccountOnFile> getAccountsOnFile() => accountsOnFile;

  @override
  String? getAcquirerCountry() => acquirerCountry;

  @override
  PaymentItemDisplayHints? getDisplayHints() => displayHints;

  @override
  String getId() => id;

  @override
  int compareTo(other) {
    return getDisplayHints()
            ?.displayOrder
            .compareTo(other.getDisplayHints()?.displayOrder) ??
        1;
  }
}
