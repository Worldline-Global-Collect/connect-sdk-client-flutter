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

import WorldlineConnectKit

struct PaymentRequestFieldValidationRequest: ValidationRequest {
    let paymentRequest: PaymentRequest
    let fieldId: String

    func validate() -> [ValidationError] {
        guard let paymentProduct = paymentRequest.paymentProduct,
              let paymentProductField = paymentProduct.paymentProductField(withId: fieldId) else {
            return [ValidationError(errorMessage: "Payment Product or Payment Product Field cannot be found on the Payment Request.", paymentProductFieldId: fieldId, rule: nil)]
        }

        return paymentProductField.validateValue(for: paymentRequest)
    }
}
