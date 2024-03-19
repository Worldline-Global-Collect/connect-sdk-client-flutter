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

part 'convert_amount_request.g.dart';

@JsonSerializable()
class ConvertAmountRequest {
  @JsonKey(required: true)
  final String source;
  @JsonKey(required: true)
  final String target;
  @JsonKey(required: true)
  final int amount;

  ConvertAmountRequest(this.source, this.target, this.amount);

  factory ConvertAmountRequest.fromJson(Map<String, dynamic> json) =>
      _$ConvertAmountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertAmountRequestToJson(this);
}
