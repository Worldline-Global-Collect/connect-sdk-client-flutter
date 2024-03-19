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

import Foundation
import Flutter
import WorldlineConnectKit

internal class ConnectSDKBridge {
    static private let TAG = "ConnectSDKBridge"
    static let shared = ConnectSDKBridge()
    private init() {}
    private var initialized = false

    func isInitialized() -> Bool {
        return initialized
    }

    func initializeConnectSDK(
        request: InitializeSDKRequest
    ) {
        ConnectSDK.initialize(
            connectSDKConfiguration: request.connectSdkConfiguration,
            paymentConfiguration: request.paymentConfiguration
        )
        initialized = true
    }
    
    func getPublicKey(result: @escaping FlutterResult) {
        ConnectSDK.clientApi.publicKey(
            success: { publicKeyResponse in
                self.forwardSuccessResult(object: PublicKeyResponse.self, dataObject: publicKeyResponse, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PublicKeyResponse.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PublicKeyResponse.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getBasicPaymentProducts(result: @escaping FlutterResult) {
        ConnectSDK.clientApi.paymentProducts(
            success: { basicPaymentProducts in
                self.forwardSuccessResult(object: BasicPaymentProducts.self, dataObject: basicPaymentProducts, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: BasicPaymentProducts.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: BasicPaymentProducts.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getPaymentProduct(request: PaymentProductRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.paymentProduct(
            withId: request.productId,
            success: { paymentProduct in
                self.forwardSuccessResult(object: PaymentProduct.self, dataObject: paymentProduct, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PaymentProduct.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PaymentProduct.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getPaymentProductGroups(result: @escaping FlutterResult) {
        ConnectSDK.clientApi.paymentProductGroups(
            success: { paymentProductGroups in
                self.forwardSuccessResult(object: BasicPaymentProductGroups.self, dataObject: paymentProductGroups, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: BasicPaymentProductGroups.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: BasicPaymentProductGroups.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getPaymentProductGroup(request: PaymentProductGroupRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.paymentProductGroup(
            withId: request.paymentProductGroupId,
            success: { paymentProductGroup in
                self.forwardSuccessResult(object: PaymentProductGroup.self, dataObject: paymentProductGroup, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PaymentProductGroup.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PaymentProductGroup.self, errorResponse: errorResponse, result: result)
            }
        )
    }

    func getPrivacyPolicy(request: PrivacyPolicyRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.privacyPolicy(
            forProduct: request.paymentProductId,
            locale: request.locale,
            success: { privacyPolicyResponse in
                self.forwardSuccessResult(object: PrivacyPolicyResponse.self, dataObject: privacyPolicyResponse, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PrivacyPolicyResponse.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PrivacyPolicyResponse.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getIinDetails(request: IinDetailsRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.iinDetails(
            forPartialCreditCardNumber: request.partialCreditCardNumber,
            success: { iiNDetailsResponse in
                self.forwardSuccessResult(object: IINDetailsResponse.self, dataObject: iiNDetailsResponse, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: IINDetailsResponse.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: IINDetailsResponse.self, errorResponse: errorResponse, result: result)
            }
        )
    }

    func getPaymentItems(result: @escaping FlutterResult) {
        ConnectSDK.clientApi.paymentItems(
            success: { paymentItems in
                self.forwardSuccessResult(object: PaymentItems.self, dataObject: paymentItems, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PaymentItems.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PaymentItems.self, errorResponse: errorResponse, result: result)
            }
        )
    }

    func getPaymentProductDirectory(request: PaymentProductDirectoryRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.directory(
            forProduct: request.productId,
            success: { directory in
                self.forwardSuccessResult(object: DirectoryEntries.self, dataObject: directory, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: DirectoryEntries.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: DirectoryEntries.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func getThirdPartyStatus(request: ThirdPartyStatusRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.thirdPartyStatus(
            forPayment: request.paymentId,
            success: { thirdPartyStatusResponse in
                self.forwardSuccessResult(object: ThirdPartyStatusResponse.self, dataObject: thirdPartyStatusResponse, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: ThirdPartyStatusResponse.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: ThirdPartyStatusResponse.self, errorResponse: errorResponse, result: result)
            }
        )
    }
    
    func convertAmount(request: ConvertAmountRequest, result: @escaping FlutterResult) {
        ConnectSDK.clientApi.convert(
            amountInCents: request.amount,
            sourceCurrency: request.source,
            targetCurrency: request.target,
            success: { convertedAmountResponse in
                self.forwardSuccessResult(object: ConvertedAmountResponse.self, dataObject: convertedAmountResponse, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: ConvertedAmountResponse.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: ConvertedAmountResponse.self, errorResponse: errorResponse, result: result)
            }
        )
    }

    func encryptPaymentRequest(request: EncryptPaymentRequest, result: @escaping FlutterResult) {
        ConnectSDK.encryptPaymentRequest(
            request.paymentRequest,
            success: { preparedPaymentRequest in
                self.forwardSuccessResult(object: PreparedPaymentRequest.self, dataObject: preparedPaymentRequest, result: result)
            },
            failure: { error in
                self.forwardFailureResult(object: PreparedPaymentRequest.self, throwable: Throwable(message: error.localizedDescription), result: result)
            },
            apiFailure: { errorResponse in
                self.forwardApiFailureResult(object: PreparedPaymentRequest.self, errorResponse: errorResponse, result: result)
            }
        )
    }

    private func forwardSuccessResult<T: Encodable>(object: T.Type, dataObject: T, result: @escaping FlutterResult) {
        let sdkResult = Result<T>(data: dataObject, error: nil, throwable: nil)
        sdkResult.forwardResultAsString(encodingErrorType: .success, result: result)
    }

    private func forwardFailureResult<T: Encodable>(object: T.Type, throwable: Throwable, result: @escaping FlutterResult) {
        let sdkResult = Result<T>(data: nil, error: nil, throwable: throwable)
        sdkResult.forwardResultAsString(encodingErrorType: .failure, result: result)
    }

    private func forwardApiFailureResult<T: Encodable>(object: T.Type, errorResponse: ApiErrorResponse, result: @escaping FlutterResult) {
        let sdkResult = Result<T>(data: nil, error: errorResponse, throwable: nil)
        sdkResult.forwardResultAsString(encodingErrorType: .apiFailure, result: result)
    }
    
    func executeWhenInitialized(_ result: @escaping FlutterResult, runWhenInitialized: @escaping () -> Void) {
        if isInitialized() {
            runWhenInitialized()
        } else {
            result(ResultError.sdkNotInitialized())
        }
    }
}

