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

part 'basic_payment_items.g.dart';

@JsonSerializable()
class BasicPaymentItems {
  @JsonKey(fromJson: _basicPaymentItemsFromJson)
  final List<BasicPaymentItem> basicPaymentItems;
  List<BasicPaymentItem> get sortedItems => _sortedList();

  @JsonKey()
  List<AccountOnFile> accountsOnFile;

  bool _hasBeenSorted = false;

  List<BasicPaymentItem> _sortedList() {
    if (!_hasBeenSorted) {
      basicPaymentItems.sort();
      _hasBeenSorted = true;
    }
    return basicPaymentItems;
  }

  BasicPaymentItems(this.basicPaymentItems,
      {List<AccountOnFile>? accountsOnFile})
      : accountsOnFile = accountsOnFile ?? [] {
    for (BasicPaymentItem item in basicPaymentItems) {
      this.accountsOnFile.addAll(item.getAccountsOnFile());
    }
  }

  factory BasicPaymentItems.fromJson(Map<String, dynamic> json) =>
      _$BasicPaymentItemsFromJson(json);
  Map<String, dynamic> toJson() => _$BasicPaymentItemsToJson(this);

  BasicPaymentItem? getBasicPaymentItemById(String basicPaymentItemId) {
    for (BasicPaymentItem item in basicPaymentItems) {
      if (item.getId() == basicPaymentItemId) {
        return item;
      }
    }
    return null;
  }
}

List<BasicPaymentItem> _basicPaymentItemsFromJson(List<dynamic> json) {
  return json.map((e) {
    final nestedBasicPaymentItem = e["basicPaymentItem"];
    if (nestedBasicPaymentItem != null) {
      return BasicPaymentItem.fromJson(nestedBasicPaymentItem);
    } else {
      return BasicPaymentItem.fromJson(e);
    }
  }).toList();
}
