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

part 'account_on_file_attribute.g.dart';

/// Represents an AccountOnFileAttribute object.
@JsonSerializable(explicitToJson: true)
class AccountOnFileAttribute {
  /// Identifying key for the [AccountOnFileAttribute].
  @JsonKey()
  String key;

  /// The value for this [AccountOnFileAttribute]
  @JsonKey()
  String value;

  /// The status of this [AccountOnFileAttribute].
  @JsonKey()
  AccountOnFileAttributeStatus status;

  /// The optional reason when an attribute value needs to be provided by the customer.
  @JsonKey()
  MustWriteReason? mustWriteReason;

  AccountOnFileAttribute(
      {this.key = "",
      this.value = "",
      this.status = AccountOnFileAttributeStatus.readOnly,
      this.mustWriteReason});

  factory AccountOnFileAttribute.fromJson(Map<String, dynamic> json) =>
      _$AccountOnFileAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AccountOnFileAttributeToJson(this);

  bool isEditingAllowed() {
    return status.isEditingAllowed;
  }
}

/// Enum containing all the possible statuses for a [AccountOnFileAttribute].
enum AccountOnFileAttributeStatus {
  @JsonValue("READ_ONLY")
  readOnly,
  @JsonValue("CAN_WRITE")
  canWrite,
  @JsonValue("MUST_WRITE")
  mustWrite
}

enum MustWriteReason {
  @JsonValue("IN_THE_PAST")
  inThePast
}

/// Extension that returns whether an [AccountOnFileAttribute] can be edited based on its [AccountOnFileAttributeStatus].
extension AccountOnFileAttributeStatusX on AccountOnFileAttributeStatus {
  bool get isEditingAllowed {
    switch (this) {
      case AccountOnFileAttributeStatus.readOnly:
        return false;
      default:
        return true;
    }
  }
}
