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
import com.worldline.connect.sdk.client.android.model.validation.ValidationErrorMessage

data class PaymentRequestFieldValidationRequest(
    val paymentRequest: PaymentRequest,
    val fieldId: String
) : ValidationRequest {
    override fun validate(): List<ValidationErrorMessage> {
        return paymentRequest.paymentProduct?.getPaymentProductFieldById(fieldId)?.validateValue(paymentRequest) ?: listOf(
            ValidationErrorMessage("Payment product or Payment Product Fields parsing failed and the field cannot be found on the payment request $this", paymentRequest.paymentProduct.id, null)
        )
    }
}