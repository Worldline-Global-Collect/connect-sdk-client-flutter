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

part 'directory_entry.g.dart';

@JsonSerializable()
class DirectoryEntry {
  /// List of countries of the issuing bank.
  @JsonKey()
  final List<String> countryNames;

  /// Identifier of the issuing bank.
  @JsonKey(required: true)
  final String issuerId;

  /// Indicates how issuers should be sorted.
  @JsonKey(required: true)
  final String issuerList;

  /// Name of the issuing bank.
  @JsonKey(required: true)
  final String issuerName;

  DirectoryEntry(
      this.countryNames, this.issuerId, this.issuerList, this.issuerName);

  factory DirectoryEntry.fromJson(Map<String, dynamic> json) =>
      _$DirectoryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryEntryToJson(this);
}
