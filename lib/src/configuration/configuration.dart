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

/// This library contains all the configuration needed to initialize the ConnectSDK.
///
/// [ConnectSDKConfiguration] is the general configuration for the ConnectSDK. It also holds an instance of
/// [SessionConfiguration] which is used for the configuration of the session for which the SDK is being initialized.
/// [PaymentConfiguration] holds configuration for a payment.
library;

import 'package:json_annotation/json_annotation.dart';

import '../../connect_sdk.dart';

part 'connect_sdk_configuration.dart';
part 'payment_configuration.dart';
part 'session_configuration.dart';
part 'configuration.g.dart';
