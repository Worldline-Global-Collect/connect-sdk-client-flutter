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
import '../models.dart';

part 'iin_details_response.g.dart';

/// Represents a IinDetailsResponse object.
@JsonSerializable(
  explicitToJson: true,
)
class IinDetailsResponse {
  /// The status for the partial credit card number used to do the lookup.
  @JsonKey(required: true)
  final IinStatus status;

  /// Id of the [PaymentProduct] that is linked to the partial credit card number.
  @JsonKey()
  final String? paymentProductId;

  /// Country code for the provided partial credit card number.
  @JsonKey()
  final String? countryCode;

  /// Whether it is allowed in this context.
  @JsonKey()
  final bool isAllowedInContext;

  /// List of co-brands linked to the brand retrieved in this lookup.
  @JsonKey()
  final List<IinDetail> coBrands;

  IinDetailsResponse(this.status,
      {required this.paymentProductId,
      required this.countryCode,
      required this.isAllowedInContext,
      this.coBrands = const []});

  factory IinDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$IinDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IinDetailsResponseToJson(this);
}
