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

import '../../models.dart';

part 'account_on_file_display_hints.g.dart';

/// Represents a AccountOnFileDisplayHints object.
@JsonSerializable(explicitToJson: true)
class AccountOnFileDisplayHints {
  /// List of [LabelTemplateElement] that help in displaying the [AccountOnFileAttribute]
  @JsonKey()
  final List<LabelTemplateElement> labelTemplate;

  /// Partial url to retrieve the logo for the [AccountOnFile]
  @JsonKey()
  final String logo;

  AccountOnFileDisplayHints(this.labelTemplate, this.logo);

  factory AccountOnFileDisplayHints.fromJson(Map<String, dynamic> json) =>
      _$AccountOnFileDisplayHintsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountOnFileDisplayHintsToJson(this);
}
