import 'package:flutter/material.dart';
import 'package:timnew_reader/widgets/Message.dart';

class UserException implements Exception {
  final String message;

  UserException(this.message);

  String toString() {
    return "錯誤: $message";
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAsSnackBar(
    BuildContext context, {
    MessageType type: MessageType.Error,
  }) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Message(message, type: type),
      ),
    );
  }

  static Message buildMessageFromError(Object error, {MessageType type: MessageType.Error}) {
    final message = error is UserException ? error.message : error.toString();
    return Message(message, type: type);
  }

  static Widget renderError(BuildContext context, Object error) {
    return Center(
      child: buildMessageFromError(error),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorAsSnackBar(
    BuildContext context,
    Object error, {
    MessageType type: MessageType.Error,
  }) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        content: buildMessageFromError(error, type: type),
      ),
    );
  }
}

// ignore: sdk_version_never
Never userError(String message) {
  throw UserException(message);
}

dynamic satisfy(bool assertion) {
  if (!assertion) return null;
  return assertion;
}

extension FutrureUserErrorExtension<T> on Future<T> {
  Future<T> userTimeout(Duration duration, String message) =>
      timeout(duration, onTimeout: () async => userError(message));
}

extension IntExtensions on int {
  bool isWithIn(int min, int max) => min <= this && this <= max;

  int ensureWithInRange(int min, int max) => this <= min
      ? min
      : this >= max
          ? max
          : this;

  int ensureMinimum(int min) => this <= min ? min : this;

  int ensureMaximum(int max) => this >= max ? max : this;
}

extension DoubleExtensions on double {
  double ensureWithInRange(double min, double max) => this <= min
      ? min
      : this >= max
          ? max
          : this;

  double ensureMinimum(double min) => this <= min ? min : this;

  double ensureMaximum(double max) => this >= max ? max : this;
}

extension VoidCallbackSafeInvoke on VoidCallback {
  void invokeIfNotNull() {
    if (this != null) this();
  }
}
