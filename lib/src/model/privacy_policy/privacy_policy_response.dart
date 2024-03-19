/*
 *
 *  * Do not remove or alter the notices in this preamble.
 *  *
 *  * This software is owned by Worldline Global Collect and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *  *
 *  * Copyright © 2024 Worldline Global Collect and/or its affiliates.
 *  *
 *  * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *  *
 *  * Please contact Worldline Global Collect for questions regarding license and user rights.
 *
 */

import 'package:json_annotation/json_annotation.dart';

part 'privacy_policy_response.g.dart';

/// Represents a PrivacyPolicyResponse object.
@JsonSerializable(
  explicitToJson: true,
)
class PrivacyPolicyResponse {
  @JsonKey()
  final String htmlContent;

  PrivacyPolicyResponse(
      {required this.htmlContent});

  factory PrivacyPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyResponseToJson(this);
}
