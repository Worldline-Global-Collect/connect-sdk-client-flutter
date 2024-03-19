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

part 'payment_product_field_display_hints.g.dart';

/// Represents a PaymentProductFieldDisplayHints object.
@JsonSerializable(explicitToJson: true)
class PaymentProductFieldDisplayHints {
  /// Whether this field should always be shown.
  @JsonKey()
  final bool alwaysShow;

  /// Whether this field should be obfuscated.
  @JsonKey()
  final bool obfuscate;

  /// The numerical order of display for this field.
  @JsonKey()
  final int displayOrder;

  /// The label for this fields.
  @JsonKey()
  final String? label;

  /// The placeholder for the customer input for this field.
  @JsonKey()
  final String? placeholderLabel;

  /// Link that should be used to replace the '{link}' variable in the label.
  @JsonKey()
  final String? link;

  /// The mask for this field value.
  @JsonKey()
  final String? mask;

  /// Preferred keyboard type.
  @JsonKey()
  final PreferredInputType preferredInputType;

  /// Information that can be provided in a tooltip to the customer.
  @JsonKey()
  final Tooltip? tooltip;

  /// The [FormElement] for this field.
  @JsonKey()
  final FormElement? formElement;

  PaymentProductFieldDisplayHints(
      this.alwaysShow,
      this.obfuscate,
      this.displayOrder,
      this.label,
      this.placeholderLabel,
      this.link,
      this.mask,
      this.preferredInputType,
      this.tooltip,
      this.formElement);

  factory PaymentProductFieldDisplayHints.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductFieldDisplayHintsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentProductFieldDisplayHintsToJson(this);
}
