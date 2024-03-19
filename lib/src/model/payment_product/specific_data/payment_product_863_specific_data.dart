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

part 'payment_product_863_specific_data.g.dart';

/// Contains payment product 863 (WeChat Pay) specific properties.
@JsonSerializable(explicitToJson: true)
class PaymentProduct863SpecificData {
  @JsonKey()
  final List<String> integrationTypes;

  PaymentProduct863SpecificData(this.integrationTypes);

  factory PaymentProduct863SpecificData.fromJson(Map<String, dynamic> json) =>
      _$PaymentProduct863SpecificDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentProduct863SpecificDataToJson(this);
}
