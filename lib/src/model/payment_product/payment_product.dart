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

part 'payment_product.g.dart';

/// Represents a [BasicPaymentProduct] and its [PaymentProductField]s.
@JsonSerializable(explicitToJson: true)
class PaymentProduct extends BasicPaymentProduct {
  /// The fields that are specific to a payment product, which the customer will need to provide.
  @JsonKey(required: true)
  List<PaymentProductField> fields;

  /// Optional warning for the fields on this product.
  @JsonKey()
  final String? fieldsWarning;

  PaymentProduct(super.id, super.paymentMethod, super.displayHints,
      {super.acquirerCountry,
      super.accountsOnFile,
      super.allowsInstallments,
      super.allowsRecurring,
      super.allowsTokenization,
      super.authenticationIndicator,
      super.autoTokenized,
      super.deviceFingerprintEnabled,
      super.maxAmount,
      super.minAmount,
      super.mobileIntegrationLevel,
      super.paymentProduct302SpecificData,
      super.paymentProduct320SpecificData,
      super.paymentProduct863SpecificData,
      super.paymentProductGroup,
      super.usesRedirectionTo3rdParty,
      super.supportsMandates,
      List<PaymentProductField>? fields,
      this.fieldsWarning})
      : fields = fields ?? [] {
    this.fields.sort();
  }

  factory PaymentProduct.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentProductToJson(this);

  PaymentProductField? getPaymentProductFieldById(
      String paymentProductFieldId) {
    for (PaymentProductField field in fields) {
      if (field.id == paymentProductFieldId) {
        return field;
      }
    }
    return null;
  }
}
