import 'package:flutter/material.dart';

import 'color.dart';

class MessageUtils {
  static void showSnackBar({
    required BuildContext context,
    required BaseStatus baseStatus,
    required String message,
  }) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 4),
      content: Text(
        message.replaceAll("\r\n", ''),
        style: const TextStyle(
          fontSize: 14
        ),
      ),
      action: SnackBarAction(
        label: "Cancel",
        textColor: Colors.white,
        onPressed: () =>
            ScaffoldMessenger.of(context).clearSnackBars(),
      ),
      backgroundColor: baseStatus == BaseStatus.error
          ? Colors.red
          : AppColors.primaryColor,

      behavior: SnackBarBehavior.floating,
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

enum BaseStatus { initial, loading, success, error, loadingMore }

extension BasseStatusExt on BaseStatus {
  bool get isInitial => this == BaseStatus.initial;

  bool get isLoading => this == BaseStatus.loading;

  bool get isSuccess => this == BaseStatus.success;

  bool get isError => this == BaseStatus.error;

  bool get isLoadingMore => this == BaseStatus.loadingMore;

  T when<T>({
    T Function()? onInitial,
    required T Function() onSuccess,
    required T Function() onLoading,
    required T Function() onError,
    required T Function() onLoadingMore,
  }) {
    switch (this) {
      case BaseStatus.initial:
        return onInitial?.call() ?? onLoading();
      case BaseStatus.loading:
        return onLoading();
      case BaseStatus.success:
        return onSuccess();
      case BaseStatus.error:
        return onError();
      case BaseStatus.loadingMore:
        return onLoadingMore();
    }
  }
}
