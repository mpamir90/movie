import 'dart:convert';
import 'package:http/http.dart';

import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

// import 'pages/authentication/authentication_route.dart';

class HttpErrorHandler {
  static Future<void> handleAsync(
    bool handleUnauthenticated,
    Response response,
  ) async {
    if (response.statusCode == 401 && handleUnauthenticated) {
      // WRouter.pushNamedAndRemoveAll(AuthenticationRoute.authenticationPath);
      return;
    }

    final dataMap = json.decode(response.body);

    final errors = dataMap["errors"];
    if (errors != null && errors is Map<String, dynamic>) {
      final errorKeys = errors.keys.toList();
      if (errorKeys.isNotEmpty) {
        final firstError = errors[errorKeys.first].first;
        if (firstError.isNotEmpty) {
          await DialogUtil.showAlertDialog(title: "Error", message: firstError);
          return;
        }
      }
    }

    final message = dataMap["message"];
    if (message != null && message is String) {
      await DialogUtil.showAlertDialog(title: "Error", message: message);
      return;
    }

    await DialogUtil.showAlertDialog(
      title: "Error",
      message: "Unknown error",
    );
  }
}
