import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  await dotenv.load();
  runApp(const SneakOutApp());
}

class SneakOutApp extends StatelessWidget {
  const SneakOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: ResponsiveDevice.breakpoints,
            ),
        onGenerateRoute: SNORouter.generateRoute,
        initialRoute: SNORouteName.login);
  }
}
