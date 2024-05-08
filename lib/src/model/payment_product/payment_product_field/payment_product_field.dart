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

import 'package:connect_sdk_client_flutter/connect_sdk.dart';
import 'package:connect_sdk_client_flutter/src/native/masking/masker.dart';
import 'package:connect_sdk_client_flutter/src/native/validation/validator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_product_field.g.dart';

/// Represents a PaymentProductField object.
@JsonSerializable(explicitToJson: true)
class PaymentProductField implements Comparable {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final PaymentProductFieldType type;

  @JsonKey()
  final PaymentProductFieldDisplayHints? displayHints;

  @JsonKey()
  final DataRestrictions dataRestrictions;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ValidationErrorMessage> errorMessageIds = [];

  PaymentProductField(this.id, this.type, this.displayHints,
      {this.dataRestrictions = const DataRestrictions.empty()});

  factory PaymentProductField.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductFieldFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentProductFieldToJson(this);

  /// Returns a list of [ValidationErrorMessage] for the supplied [value].
  /// If the list is empty, you can assume that the supplied [value] is a valid value.
  Future<List<ValidationErrorMessage>> validateValue(
      PaymentRequest paymentRequest) async {
    final errorMessages =
        await PaymentProductFieldValidator.validatePaymentProductField(
            paymentRequest, this);
    errorMessageIds = errorMessages;
    return errorMessages;
  }

  /// Returns the masked [value] of the [PaymentProductField].
  Future<String> applyMask(String value) async {
    return await PaymentProductFieldMasker.applyMask(this, value);
  }

  /// Returns the unmasked [value] of the [PaymentProductField].
  Future<String> removeMask(String value) async {
    return await PaymentProductFieldMasker.removeMask(this, value);
  }

  @override
  int compareTo(other) {
    if (displayHints == null && other.displayHints == null) {
      return 0;
    } else {
      return displayHints?.displayOrder
              .compareTo(other.displayHints?.displayOrder) ??
          -1;
    }
  }
}
