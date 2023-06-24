// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:watt/watt.dart';
// import 'package:witt/witt.dart';

// import '../dtos/authentication/out_login_dto.dart';
// import '../models/bearer_model.dart';
// import '../pages/authentication/authentication_route.dart';
// import '../services/authentication_service.dart';

// class AuthenticationController {
//   late final HttpClient httpClient;
//   late final AuthenticationService authenticationService;
//   late final FlutterSecureStorage storage;

//   AuthenticationController({required BuildContext context}) {
//     Future.delayed(Duration.zero, () {
//       httpClient = WProvider.of<HttpClient>(context);
//       authenticationService = WProvider.of<AuthenticationService>(context);
//       storage = WProvider.of<FlutterSecureStorage>(context);
//     });
//   }

//   BearerModel? bearerModel;

//   Future<bool> loginAsync({
//     required OutLoginDto dto,
//     HttpTransaction? transaction,
//   }) async {
//     final inLoginDto = await authenticationService.loginAsync(
//       dto: dto,
//       transaction: transaction,
//     );

//     if (inLoginDto == null) {
//       return false;
//     }

//     final bearerModel = BearerModel(
//       token: inLoginDto.accessToken!,
//       refreshToken: inLoginDto.refreshToken!,
//       expiredAt: DateTime.now().add(
//         Duration(seconds: (inLoginDto.expiresIn! - 10).toInt()),
//       ),
//     );

//     await storage.write(key: "bearer", value: bearerModel.toJson());

//     this.bearerModel = bearerModel;
//     httpClient.bearerToken = bearerModel.token;

//     return true;
//   }

//   Future<bool> checkLastAuthenticationAsync() async {
//     final bearer = await storage.read(key: "bearer");
//     if (bearer == null) {
//       return false;
//     }

//     bearerModel = BearerModel.fromJson(bearer);
//     httpClient.bearerToken = bearerModel!.token;

//     return true;
//   }

//   Future<void> logoutAsync() async {
//     await storage.deleteAll();
//     httpClient.bearerToken = null;

//     WRouter.pushNamedAndRemoveAll(AuthenticationRoute.authenticationPath);
//     return;
//   }
// }
