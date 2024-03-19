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

package com.worldline.connect.connect_sdk_client_flutter.validation.models

import com.worldline.connect.sdk.client.android.model.paymentrequest.PaymentRequest
import com.worldline.connect.sdk.client.android.model.validation.AbstractValidationRule
import com.worldline.connect.sdk.client.android.model.validation.ValidationErrorMessage

data class PaymentRequestRuleValidationRequest(
    val paymentRequest: PaymentRequest,
    val fieldId: String,
    val rule: AbstractValidationRule
) : ValidationRequest {
    override fun validate(): List<ValidationErrorMessage> {
        return if (rule.validate(paymentRequest, fieldId)) emptyList() else listOf(
            ValidationErrorMessage(rule.messageId, fieldId, rule)
        )
    }
}