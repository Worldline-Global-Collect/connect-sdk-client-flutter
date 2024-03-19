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

part 'amount_of_money.g.dart';

/// Contains money information for a payment.
@JsonSerializable(explicitToJson: true)
class AmountOfMoney {
  /// The amount of money in cents as an int.
  @JsonKey(required: true)
  final int amount;

  /// Currency code of the transaction that will take place, should match the <a href="https://www.iso.org/iso-4217-currency-codes.html">ISO-4217 standard</a>.
  @JsonKey(required: true)
  final String currencyCode;

  AmountOfMoney(this.amount, this.currencyCode);

  factory AmountOfMoney.fromJson(Map<String, dynamic> json) =>
      _$AmountOfMoneyFromJson(json);

  Map<String, dynamic> toJson() => _$AmountOfMoneyToJson(this);
}
