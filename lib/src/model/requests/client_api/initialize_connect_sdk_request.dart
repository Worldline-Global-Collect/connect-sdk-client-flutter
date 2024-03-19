/*
 * Do not remove or alter the notices in this preamble.
 *
 * This software is owned by Worldline Global Collect and may not be be altered, copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way, without the prior written consent of Worldline.
 *
 * Copyright © 2023 Worldline Global Collect and/or its affiliates.
 *
 * All rights reserved. License grant and user rights and obligations according to the applicable license agreement.
 *
 * Please contact Worldline Global Collect for questions regarding license and user rights.
 */

import 'package:connect_sdk_client_flutter/src/configuration/configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'initialize_connect_sdk_request.g.dart';

/// Request used to initiate a [Session].
@JsonSerializable(explicitToJson: true)
class InitializeConnectSdkRequest {
  @JsonKey(required: true)
  final ConnectSDKConfiguration connectSdkConfiguration;
  @JsonKey(required: true)
  final PaymentConfiguration paymentConfiguration;

  InitializeConnectSdkRequest(
      this.connectSdkConfiguration, this.paymentConfiguration);

  factory InitializeConnectSdkRequest.fromJson(Map<String, dynamic> json) =>
      _$InitializeConnectSdkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InitializeConnectSdkRequestToJson(this);
}
