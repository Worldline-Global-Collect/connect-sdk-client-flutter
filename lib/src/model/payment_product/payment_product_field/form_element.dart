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

part 'form_element.g.dart';

/// Represents a FormElement object.
/// The FormElement is used for determining how a [PaymentProductField] should be presented.
@JsonSerializable(explicitToJson: true)
class FormElement {
  /// The type of this [FormElement].
  @JsonKey()
  final FormElementType type;

  /// A list of values to be displayed in this [FormElement].
  @JsonKey()
  final List<ValueMap>? valueMapping;

  FormElement(this.type, {this.valueMapping});
  const FormElement.empty(
      {this.type = FormElementType.text, this.valueMapping = const []});

  factory FormElement.fromJson(Map<String, dynamic> json) =>
      _$FormElementFromJson(json);

  Map<String, dynamic> toJson() => _$FormElementToJson(this);
}
