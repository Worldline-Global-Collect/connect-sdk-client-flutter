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

import '../../models.dart';

part 'payment_product_group.g.dart';

@JsonSerializable()
class PaymentProductGroup extends BasicPaymentProductGroup {
  bool _hasBeenSorted = false;

  /// The [PaymentProductGroup] specific [PaymentProductField]s that the customer will need to provide to finish a payment.
  @JsonKey()
  final List<PaymentProductField> fields;
  List<PaymentProductField> get sortedFields => _getSortedList();

  PaymentProductGroup(this.fields, super.id, super.displayHints,
      super.allowsInstallments, super.deviceFingerprintEnabled,
      {super.accountsOnFile});
  factory PaymentProductGroup.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentProductGroupToJson(this);

  PaymentProductField? getPaymentProductFieldById(String id) {
    for (PaymentProductField field in fields) {
      if (field.id == id) {
        return field;
      }
    }
    return null;
  }

  List<PaymentProductField> _getSortedList() {
    _sortList();
    return fields;
  }

  _sortList() {
    if (!_hasBeenSorted) {
      fields.sort();
      _hasBeenSorted = true;
    }
  }
}
