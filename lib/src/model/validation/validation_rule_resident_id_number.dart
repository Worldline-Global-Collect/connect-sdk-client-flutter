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

part 'validation_rule_resident_id_number.g.dart';

@JsonSerializable()
class ValidationRuleResidentIdNumber extends ValidationRule {
  ValidationRuleResidentIdNumber(super.validationType, super.messageId);

  factory ValidationRuleResidentIdNumber.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleResidentIdNumberFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValidationRuleResidentIdNumberToJson(this);
}
