import 'package:Pam_App/services/auth_service/auth_services.dart';
import 'package:Pam_App/utils/libraries/app_libraries.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  await Locales.init(['en', 'urdu']);
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await GetStorage.init();
  // bio
  AuthService auth = AuthService();
  await Get.putAsync(() => auth.init());
  // await Get.putAsync(() => bio.init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(builder: (locale) {
      return GetMaterialApp(
        localizationsDelegates: Locales.delegates,
        locale: locale,
        //title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        defaultTransition: Get.defaultTransition,
        supportedLocales: Locales.supportedLocales,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        //home: MyHomePage(),
      );
    });
  }
}
