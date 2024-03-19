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

part of 'configuration.dart';

/// Configuration of the payment that the SDK is being initialized for.
@JsonSerializable()
class PaymentConfiguration {
  /// The context of this payment with information regarding currency, amount, etc.
  @JsonKey(required: true)
  final PaymentContext paymentContext;

  /// Whether to group payment products together when retrieving them from the API.
  @JsonKey(required: true)
  bool groupPaymentProducts = false;

  PaymentConfiguration(this.paymentContext,
      {this.groupPaymentProducts = false});

  factory PaymentConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PaymentConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentConfigurationToJson(this);
}
