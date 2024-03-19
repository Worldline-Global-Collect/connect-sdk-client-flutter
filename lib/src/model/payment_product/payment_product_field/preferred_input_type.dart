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

import 'package:json_annotation/json_annotation.dart';

/// Enum containing all the possible keyboard types required to fill in a value of a [PaymentProductField].
enum PreferredInputType {
  @JsonValue("IntegerKeyboard")
  integerKeyboard,
  @JsonValue("StringKeyboard")
  stringKeyboard,
  @JsonValue("PhoneNumberKeyboard")
  phoneNumberKeyboard,
  @JsonValue("EmailAddressKeyboard")
  emailAddressKeyboard
}
