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

part of 'configuration.dart';

/// Configuration of the session for the SDK that allows the SDK to communicate with the API.
@JsonSerializable()
class SessionConfiguration {
  @JsonKey(required: true)
  final String clientSessionId;

  @JsonKey(required: true)
  final String customerId;

  @JsonKey(required: true)
  final String clientApiUrl;

  @JsonKey(required: true)
  final String assetUrl;

  SessionConfiguration(
      {required this.clientSessionId,
      required this.customerId,
      required this.clientApiUrl,
      required this.assetUrl});

  factory SessionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SessionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SessionConfigurationToJson(this);
}
