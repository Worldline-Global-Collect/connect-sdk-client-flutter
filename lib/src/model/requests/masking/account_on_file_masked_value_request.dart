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

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import '../../models.dart';

part 'account_on_file_masked_value_request.g.dart';

/// Request used to retrieve the masked value of a field in an [AccountOnFile].
@JsonSerializable(explicitToJson: true)
class AccountOnFileMaskedValueRequest {
  @JsonKey(required: true)
  final AccountOnFile accountOnFile;

  @JsonKey(required: true)
  final String fieldId;

  AccountOnFileMaskedValueRequest(this.accountOnFile, this.fieldId);

  factory AccountOnFileMaskedValueRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountOnFileMaskedValueRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AccountOnFileMaskedValueRequestToJson(this);

  String toJsonString() => jsonEncode(this);
}
