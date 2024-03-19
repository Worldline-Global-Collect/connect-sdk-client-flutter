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

part 'validation_rule_email_address.g.dart';

/// Used for validation of an email address.
@JsonSerializable()
class ValidationRuleEmailAddress extends ValidationRule {
  ValidationRuleEmailAddress(super.validationType, super.messageId);

  factory ValidationRuleEmailAddress.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleEmailAddressFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValidationRuleEmailAddressToJson(this);
}
