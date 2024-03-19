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

import '../../../native/masking/masker.dart';
import '../../models.dart';

part 'account_on_file.g.dart';

/// Represents an AccountOnFile object.
@JsonSerializable(explicitToJson: true)
class AccountOnFile {
  @JsonKey(required: true)
  final String id;

  /// Identifier of the [PaymentProduct] that this [AccountOnFile] is linked to.
  @JsonKey(required: true)
  final String paymentProductId;

  /// The display hints for this [AccountOnFile]
  @JsonKey()
  final AccountOnFileDisplayHints displayHints;

  /// Attributes for this [AccountOnFile]
  @JsonKey()
  final List<AccountOnFileAttribute> attributes;

  AccountOnFile(this.id, this.paymentProductId, this.displayHints,
      {this.attributes = const []});

  factory AccountOnFile.fromJson(Map<String, dynamic> json) =>
      _$AccountOnFileFromJson(json);

  Map<String, dynamic> toJson() => _$AccountOnFileToJson(this);

  /// Returns the label which can be displayed on an [AccountOnFile] selection screen.
  String getLabel() {
    String label = "";
    final template = displayHints.labelTemplate.firstOrNull;
    if (template != null) {
      for (final attribute in attributes) {
        if (template.attributeKey == attribute.key) {
          label = attribute.value;
        }
      }
    }
    return label;
  }

  /// Returns the masked value for the given payment product [fieldId].
  Future<String> getMaskedValue(String fieldId) async {
    return await AccountOnFileMasker.maskedValue(this, fieldId);
  }

  /// Returns the value for the given payment product [fieldId] with a custom [mask] applied.
  Future<String> getMaskedValueWithCustomMask(
      String fieldId, String mask) async {
    return await AccountOnFileMasker.customMaskedValue(this, fieldId, mask);
  }
}
