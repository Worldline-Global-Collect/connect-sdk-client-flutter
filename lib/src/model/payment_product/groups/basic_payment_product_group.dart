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

import 'package:connect_sdk_client_flutter/src/model/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_payment_product_group.g.dart';

@JsonSerializable()
class BasicPaymentProductGroup implements BasicPaymentItem {
  /// List of known [AccountOnFile] for this group.
  @JsonKey()
  final List<AccountOnFile> accountsOnFile;

  /// Whether the group allows payments in installments.
  @JsonKey()
  final bool allowsInstallments;

  /// Whether device fingerprinting is enabled for this group.
  @JsonKey()
  final bool deviceFingerprintEnabled;

  /// The display hints for this group.
  @JsonKey()
  final PaymentItemDisplayHints displayHints;

  /// The group's identifier. Group identifiers are not numerical, i.e. 'cards'.
  @JsonKey(required: true)
  final String id;

  BasicPaymentProductGroup(this.id, this.displayHints, this.allowsInstallments,
      this.deviceFingerprintEnabled,
      {this.accountsOnFile = const []});

  factory BasicPaymentProductGroup.fromJson(Map<String, dynamic> json) =>
      _$BasicPaymentProductGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BasicPaymentProductGroupToJson(this);

  @override
  List<AccountOnFile> getAccountsOnFile() => accountsOnFile;

  @override
  String? getAcquirerCountry() => null;

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
