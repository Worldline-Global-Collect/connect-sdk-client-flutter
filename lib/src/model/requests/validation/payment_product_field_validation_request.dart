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

import 'package:connect_sdk_client_flutter/src/model/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_product_field_validation_request.g.dart';

/// Request used to validate the value of a [PaymentProductField].
@JsonSerializable(explicitToJson: true)
class PaymentProductFieldValidationRequest {
  @JsonKey(required: true)
  final PaymentRequest paymentRequest;

  @JsonKey(required: true)
  final PaymentProductField field;

  PaymentProductFieldValidationRequest(this.paymentRequest, this.field);

  factory PaymentProductFieldValidationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentProductFieldValidationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentProductFieldValidationRequestToJson(this);

  String toJsonString() => jsonEncode(this);
}
