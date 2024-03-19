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
package com.worldline.connect.connect_sdk_client_flutter.adapters

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.worldline.connect.sdk.client.android.model.validation.AbstractValidationRule
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleBoletoBancarioRequiredness
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleEmailAddress
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleExpirationDate
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleFixedList
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleIBAN
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleLength
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleLuhn
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleRange
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleRegex
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleResidentIdNumber
import com.worldline.connect.sdk.client.android.model.validation.ValidationRuleTermsAndConditions
import com.worldline.connect.sdk.client.android.model.validation.ValidationType
import java.lang.reflect.Type

class ValidationRuleTypeAdapter : JsonDeserializer<AbstractValidationRule> {
    override fun deserialize(
        json: JsonElement?,
        typeOfT: Type?,
        context: JsonDeserializationContext?
    ): AbstractValidationRule {
        return when (val type = json?.asJsonObject?.get("validationType")?.asString) {
            ValidationType.LENGTH.name -> deserializeValidationRule<ValidationRuleLength>(context, json)
            ValidationType.RANGE.name -> deserializeValidationRule<ValidationRuleRange>(context, json)
            ValidationType.REGULAREXPRESSION.name -> deserializeValidationRule<ValidationRuleRegex>(context, json)
            ValidationType.EMAILADDRESS.name -> deserializeValidationRule<ValidationRuleEmailAddress>(context, json)
            ValidationType.EXPIRATIONDATE.name -> deserializeValidationRule<ValidationRuleExpirationDate>(context, json)
            ValidationType.LUHN.name -> deserializeValidationRule<ValidationRuleLuhn>(context, json)
            ValidationType.FIXEDLIST.name ->deserializeValidationRule<ValidationRuleFixedList>(context, json)
            ValidationType.TERMSANDCONDITIONS.name -> deserializeValidationRule<ValidationRuleTermsAndConditions>(context, json)
            ValidationType.IBAN.name -> deserializeValidationRule<ValidationRuleIBAN>(context, json)
            ValidationType.RESIDENTIDNUMBER.name -> deserializeValidationRule<ValidationRuleResidentIdNumber>(context, json)
            ValidationType.BOLETOBANCARIOREQUIREDNESS.name -> deserializeValidationRule<ValidationRuleBoletoBancarioRequiredness>(context, json)
            else -> throw IllegalArgumentException("Unknown ValidationType: $type")
        }

    }

    private inline fun <reified T : AbstractValidationRule> deserializeValidationRule(context: JsonDeserializationContext?, json: JsonElement?) : AbstractValidationRule{
        val rule = context?.deserialize<T>(json, T::class.java)
        return rule as AbstractValidationRule
    }
}