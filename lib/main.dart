import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:netplix_app/config/environment.dart';
import 'package:netplix_app/config/provider_setting.dart';
import 'package:netplix_app/config/routes/app_pages.dart';
import 'package:netplix_app/features/home/representation/ui/home_screen.dart';
import 'package:netplix_app/injection.dart' as inject;
import 'package:provider/provider.dart';

void main() async {
  inject.init();

  await dotenv.load(fileName: Environment.filename);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetting.mainProvider,
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
        routerConfig: AppPages.router,
      ),
    );
  }
}
