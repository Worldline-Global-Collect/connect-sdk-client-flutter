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

import 'package:connect_sdk_client_flutter/src/model/client_api/third_party_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

/// Enum containing all the possible statuses of a [ThirdPartyStatusResponse].
enum ThirdPartyStatus {
  @JsonValue("WAITING")
  waiting,
  @JsonValue("INITIALIZED")
  initialized,
  @JsonValue("AUTHORIZED")
  authorized,
  @JsonValue("COMPLETED")
  completed
}
