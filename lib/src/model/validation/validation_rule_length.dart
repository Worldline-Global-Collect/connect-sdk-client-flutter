/*
 * Do not remove or alter the notices in this preamble.
 *
 * This software is owned by Worldline Global Collect and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *
 * Copyright © 2023 Worldline Global Collect and/or its affiliates.
 *
 * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *
 * Please contact Worldline Global Collect for questions regarding license and user rights.
 */

import 'package:json_annotation/json_annotation.dart';
import '../models.dart';

part 'validation_rule_length.g.dart';

/// Used for validation of the length of an input.
@JsonSerializable()
class ValidationRuleLength extends ValidationRule {
  @JsonKey(required: true)
  final int minLength;

  @JsonKey(required: true)
  final int maxLength;

  ValidationRuleLength(
      super.validationType, super.messageId, this.minLength, this.maxLength);

  factory ValidationRuleLength.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleLengthFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ValidationRuleLengthToJson(this)..addAll({'messageId': "length"});
}
