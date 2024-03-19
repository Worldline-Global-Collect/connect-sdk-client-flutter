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

part 'basic_payment_product_groups.g.dart';

@JsonSerializable()
class BasicPaymentProductGroups {
  /// List of all the known [BasicPaymentProductGroup]s.
  @JsonKey(name: "paymentProductGroups")
  final List<BasicPaymentProductGroup> basicPaymentProductGroups;

  /// List of all the known [AccountOnFile] across all [BasicPaymentProductGroup]
  final List<AccountOnFile> _accountsOnFile = List.empty(growable: true);

  BasicPaymentProductGroups(this.basicPaymentProductGroups) {
    basicPaymentProductGroups.sort();
  }
  List<AccountOnFile> getAccountsOnFile() {
    if (_accountsOnFile.isEmpty) {
      for (var product in basicPaymentProductGroups) {
        _accountsOnFile.addAll(product.accountsOnFile);
      }
    }
    return _accountsOnFile;
  }

  BasicPaymentProductGroup? getPaymentProductGroupById(
      String paymentProductGroupId) {
    for (var group in basicPaymentProductGroups) {
      if (group.id == paymentProductGroupId) {
        return group;
      }
    }
    return null;
  }

  List<BasicPaymentItem> getPaymentProductGroupsAsItems() =>
      basicPaymentProductGroups;

  factory BasicPaymentProductGroups.fromJson(Map<String, dynamic> json) =>
      _$BasicPaymentProductGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$BasicPaymentProductGroupsToJson(this);
}
