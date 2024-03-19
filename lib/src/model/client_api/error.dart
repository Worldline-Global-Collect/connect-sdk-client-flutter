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

part 'error.g.dart';

@JsonSerializable(explicitToJson: true)
class Error {
  @JsonKey()
  String? category;

  @JsonKey(required: true)
  String code;

  @JsonKey()
  int? httpStatusCode;

  @JsonKey()
  String? id;

  @JsonKey()
  String? message;

  @JsonKey()
  String? propertyName;

  @JsonKey()
  String? requestId;

  Error(this.code, this.httpStatusCode, this.message,
      {this.category, this.id, this.propertyName, this.requestId});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
