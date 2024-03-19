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

part 'payment_item_display_hints.g.dart';

/// Represents a PaymentProductDisplayHints object.
@JsonSerializable(explicitToJson: true)
class PaymentItemDisplayHints {
  /// The display order for this payment item.
  @JsonKey()
  final int displayOrder;

  /// The label for this payment item.
  @JsonKey()
  final String label;

  /// The partial logo url that can be used to retrieve the logo for this payment item.
  @JsonKey(name: "logo")
  String logoUrl;

  PaymentItemDisplayHints(this.label,
      {required this.displayOrder, required this.logoUrl});

  factory PaymentItemDisplayHints.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemDisplayHintsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentItemDisplayHintsToJson(this);
}
