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
import '../../models.dart';

part 'payment_product_request.g.dart';

/// Request used to retrieve a [PaymentProduct] from the API.
@JsonSerializable(explicitToJson: true)
class PaymentProductRequest {
  @JsonKey(required: true)
  final String productId;

  PaymentProductRequest({required this.productId});

  factory PaymentProductRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentProductRequestToJson(this);
}
