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

/// The main configuration class for the ConnectSDK.
/// Necessary for the initialization of the SDK.
@JsonSerializable()
class ConnectSDKConfiguration {
  /// The configuration for the current session.
  @JsonKey(required: true)
  final SessionConfiguration sessionConfiguration;

  /// Whether the network calls should be logged - should be `false` in production.
  @JsonKey(required: true)
  bool enableNetworkLogs = false;

  /// The optional applicationId that will be used in the metadata of the API calls and payment encryption.
  @JsonKey(required: true)
  String? applicationId;

  /// The optional ipAddress that will be used in the metadata of the API calls and payment encryption.
  @JsonKey(required: true)
  String? ipAddress;

  /// This property will always be false as transferring images from the native SDKs to this SDK will not work. Loading images can be done with the [ClientApi.retrieveLogo] function.
  @JsonKey(includeToJson: true, name: "preLoadImages")
  final bool _preLoadImages = false;

  ConnectSDKConfiguration(this.sessionConfiguration,
      {this.enableNetworkLogs = false, this.applicationId, this.ipAddress});

  factory ConnectSDKConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConnectSDKConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectSDKConfigurationToJson(this);
}
