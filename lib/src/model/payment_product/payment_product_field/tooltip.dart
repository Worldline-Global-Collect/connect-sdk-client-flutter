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

part 'tooltip.g.dart';

@JsonSerializable(explicitToJson: true)
class Tooltip {
  /// The label to be used for this tooltip.
  @JsonKey()
  final String? label;

  /// The partial url that can be used to retrieve a logo.
  @JsonKey(name: "image")
  final String? imageUrl;

  Tooltip(this.imageUrl, {this.label});

  factory Tooltip.fromJson(Map<String, dynamic> json) =>
      _$TooltipFromJson(json);

  Map<String, dynamic> toJson() => _$TooltipToJson(this);
}
