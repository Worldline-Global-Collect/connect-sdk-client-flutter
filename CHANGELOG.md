## 1.1.1
## Fixed
- Fixed an issue where the collected metadata did not properly identify the Flutter SDK.
## 1.1.0
This SDK is a rebranded and updated version of the SDK that was previously published under the Ingenico name. Next to renaming to Worldline, there were some minor changes. Please have a look at the release notes below to see what has changed. Previous versions and release notes of this SDK can be found [here](https://github.com/Ingenico-ePayments/connect-sdk-client-flutter).

Some minor changes were also made in the Flutter SDK:

## Added: 
- The function `getPrivacyPolicy` was added to the `ClientApi` to retrieve the policy for a `paymentProductId` and/or `locale`. Providing no `paymentProductId` will retrieve all available payment product policies. Providing no `locale` will return the default 'en_US' locale.

## Fixed:
- `displayHints` in `PaymentProductField` is now of type `PaymentProductFieldDisplayHints?` because it can be null in the native SDKs.

## Removed:
- `PaymentProductFieldDisplayHints.empty` constructor has been removed.

## 1.0.0
Initial release of the Flutter SDK that can be used to connect to the Worldline Global Collect Client API. The SDK can only be used on the Android and iOS platforms.
