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

import 'package:connect_sdk_client_flutter/src/extensions/extensions.dart';
import 'package:connect_sdk_client_flutter/src/model/models.dart';

/// The interface linking products and groups so they can be returned in an unified list.
abstract class BasicPaymentItem implements Comparable {
  String getId();

  PaymentItemDisplayHints? getDisplayHints();

  List<AccountOnFile> getAccountsOnFile();

  String? getAcquirerCountry();

  factory BasicPaymentItem.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    if (id.isNumeric()) {
      return BasicPaymentProduct.fromJson(json);
    } else {
      return BasicPaymentProductGroup.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    if (getId().isNumeric()) {
      return (this as BasicPaymentProduct).toJson();
    } else {
      return (this as BasicPaymentProductGroup).toJson();
    }
  }
}
