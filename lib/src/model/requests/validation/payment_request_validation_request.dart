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

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import '../../models.dart';

part 'payment_request_validation_request.g.dart';

/// Request used to validate a [PaymentProductField] in a [PaymentRequest].
@JsonSerializable(explicitToJson: true)
class PaymentRequestValidationRequest {
  @JsonKey(required: true)
  final PaymentRequest paymentRequest;

  PaymentRequestValidationRequest(this.paymentRequest);

  factory PaymentRequestValidationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestValidationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentRequestValidationRequestToJson(this);

  String toJsonString() => jsonEncode(this);
}
