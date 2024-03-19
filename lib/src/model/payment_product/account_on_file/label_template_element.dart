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
import 'package:json_annotation/json_annotation.dart';

part 'label_template_element.g.dart';

/// Represents a LabelTemplateElement.
@JsonSerializable(explicitToJson: true)
class LabelTemplateElement {
  /// Key of the [AccountOnFileAttribute] that this template should be used for.
  @JsonKey()
  final String attributeKey;

  /// The mask that can be applied to attribute value.
  @JsonKey()
  final String? mask;

  LabelTemplateElement({required this.attributeKey, required this.mask});

  factory LabelTemplateElement.fromJson(Map<String, dynamic> json) =>
      _$LabelTemplateElementFromJson(json);

  Map<String, dynamic> toJson() => _$LabelTemplateElementToJson(this);
}
