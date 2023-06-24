import 'package:flutter/material.dart';
import 'package:movie/pages/main/main_route.dart';
import 'package:watt/watt.dart';
import 'package:witt/witt.dart';

import 'constants/configurations.dart';
import 'controllers/authentication_controller.dart';
import 'http_error_handler.dart';
import 'pages/movie/movie_route.dart';
import 'services/movies_services.dart';

void main() {
  final httpClient = HttpClient(
    userAgent: Configurations.appName,
    httpErrorHandler: HttpErrorHandler.handleAsync,
  );

  final app = WMultiProvider(
    providers: [
      WProvider(service: (context) => httpClient),
      WProvider(
        service: (context) => MoviesServices(context: context),
      ),
    ],
    child: const _App(),
  );

  runApp(app);
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return Watt(
      lightPalette: PaletteData.kLightPalette.copyWith(
        primary: ColorUtil.createMaterialColor(const Color(0xFF303E47)),
        secondary: ColorUtil.createMaterialColor(const Color(0xFF93C42B)),
        onPrimary: ColorUtil.createMaterialColor(Colors.white),
        onSecondary: ColorUtil.createMaterialColor(Colors.white),
        background: ColorUtil.createMaterialColor(const Color(0xFFF9FAFC)),
        gray: ColorUtil.createMaterialColor(
            const Color.fromARGB(255, 132, 134, 139)),
        black: ColorUtil.createMaterialColor(const Color(0xFF1f2b38)),
      ),
      builder: (context, theme, darkTheme) {
        return MaterialApp(
          navigatorKey: WRouter.navigatorKey,
          title: Configurations.appName,
          theme: theme,
          initialRoute: MainRoute.mainPath,
          onGenerateRoute: (settings) => WRouter.onGenerateRoute(
            settings: settings,
            pages: [
              ...MainRoute.route(),
              ...MovieRoute.route(),
            ],
          ),
        );
      },
    );
  }
}
