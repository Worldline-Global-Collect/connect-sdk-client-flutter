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

part 'value_map.g.dart';

@JsonSerializable()
class ValueMap {
  @JsonKey()
  final String value;

  /// List of [PaymentProductFieldDisplayElement]
  @JsonKey()
  final List<PaymentProductFieldDisplayElement> displayElements;

  ValueMap(this.value, this.displayElements);

  factory ValueMap.fromJson(Map<String, dynamic> json) =>
      _$ValueMapFromJson(json);

  Map<String, dynamic> toJson() => _$ValueMapToJson(this);
}
