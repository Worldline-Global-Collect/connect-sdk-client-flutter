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

import 'package:connect_sdk_client_flutter/connect_sdk.dart';
import 'package:json_annotation/json_annotation.dart';

part 'iin_detail.g.dart';

/// Represents a IinDetail object.
@JsonSerializable(explicitToJson: true)
class IinDetail {
  /// Id of the [PaymentProduct] linked to this [IinDetail]
  @JsonKey(required: true)
  final String paymentProductId;

  /// Whether it is allowed in context.
  @JsonKey(required: true)
  final bool isAllowedInContext;

  IinDetail(this.paymentProductId, this.isAllowedInContext);

  factory IinDetail.fromJson(Map<String, dynamic> json) =>
      _$IinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$IinDetailToJson(this);
}
