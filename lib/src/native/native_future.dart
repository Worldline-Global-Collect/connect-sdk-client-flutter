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

part of '../../connect_sdk.dart';

class _NativeFuture<T> {
  final Future<String> _job;
  final T Function(Object?) _fromJson;
  final _NativeFutureListener<T> _listener;

  _NativeFuture(this._job, this._fromJson, this._listener);

  awaitJob() async {
    return await _job.then((value) {
      final result = _parseResult(value);
      final resultStatus = result.status();
      switch (resultStatus) {
        case NativeSdkResultStatus.success:
          final data = result.data;
          data == null
              ? _listener.failure(NativeException.fromThrowable(Throwable(
                  "No data available for successful call",
                  throwable: null)))
              : _listener.success(data);
        case NativeSdkResultStatus.apiError:
          _listener.apiError(result.error ??
              ApiErrorResponse(
                  "ApiError status without ApiErrorResponse!", []));
        case NativeSdkResultStatus.exception:
          _listener.failure(NativeException.fromThrowable(result.throwable ??
              Throwable("Exception status without throwable",
                  throwable: null)));
      }
    }).onError((error, stackTrace) {
      _listener.failure(NativeException.fromThrowable(Throwable(
          error.toString(),
          throwable: Throwable(stackTrace.toString(), throwable: null))));
    });
  }

  NativeSdkResult<T> _parseResult(String response) {
    Map<String, dynamic> json = jsonDecode(response);
    final result = NativeSdkResult<T>.fromJson(json, _fromJson);
    return result;
  }
}
