import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:reserly_manager/config/preferences.dart';
import 'package:reserly_manager/config/theme.dart';
import 'package:get/get.dart';
import 'package:reserly_manager/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.init("21792b91-5514-4525-8925-fef85c09b43a");
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

  // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  // await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);

  final _pref = new Preferences();
  await _pref.initPrefs();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pref = Preferences();
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: {
        const Locale('es', 'ES'),
      },
      locale: Locale('es', 'ES'),
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      initialRoute: _pref.token != null ? '/home' : '/login',
      getPages: AppPages.routes,
      theme: appTheme,
    );
  }
}



