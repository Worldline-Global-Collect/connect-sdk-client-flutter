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

part 'payment_product_field_display_element.g.dart';

@JsonSerializable()
class PaymentProductFieldDisplayElement {
  /// The id for this [PaymentProductFieldDisplayElement].
  @JsonKey()
  final String id;

  /// The value to be displayed.
  @JsonKey()
  final String value;

  /// The type indicating the sort of data and how it should be displayed.
  @JsonKey()
  final PaymentProductFieldDisplayElementType type;

  PaymentProductFieldDisplayElement(this.id, this.value, this.type);
  factory PaymentProductFieldDisplayElement.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentProductFieldDisplayElementFromJson(json);
  Map<String, dynamic> toJson() =>
      _$PaymentProductFieldDisplayElementToJson(this);
}
