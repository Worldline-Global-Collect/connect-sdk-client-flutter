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

import 'package:connect_sdk_client_flutter/src/model/client_api/third_party_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'third_party_status_response.g.dart';

@JsonSerializable()
class ThirdPartyStatusResponse {
  @JsonKey()
  ThirdPartyStatus thirdPartyStatus;

  ThirdPartyStatusResponse(this.thirdPartyStatus);

  factory ThirdPartyStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ThirdPartyStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThirdPartyStatusResponseToJson(this);
}
