import 'package:Pam_App/utils/libraries/app_libraries.dart';

class AppPages {
  static var initial = Routes.dashboardScreen;
  static final routes = [
    //----------------------Splash Screen------------------
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    //----------------------Login screen route------------------
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),

    //----------------------Register As Screen------------------
    GetPage(
      name: Routes.registerAsScreen,
      page: () => RegisterAsScreen(),
      binding: RegisterAsBinding(),
    ),
    //----------------------Enter worker code Screen------------------
    GetPage(
      name: Routes.enterWorkerCodeScreen,
      page: () => EnterWorkerCodeScreen(),
      binding: EnterWorkerCodeBinding(),
    ),

    //----------------------Registration screen route------------------
    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
      binding: RegistrationScreenBinding(),
    ),

    //----------------------Verify Otp screen route------------------
    GetPage(
      name: Routes.verifyOtpScreen,
      page: () => VerifyOtpScreen(),
      binding: VerifyCodeBinding(),
    ),

    //----------------------Register success route------------------
    GetPage(
      name: Routes.registerSuccess,
      page: () => const RegisterSuccess(),
      binding: RegisterSuccessBinding(),
    ),

    //----------------------Dashboard screen route------------------

    GetPage(
      name: Routes.dashboardScreen,
      page: () => const DashboardScreen(),
      middlewares: [
        AuthMiddleware(),
      ],
      binding: DashboardScreenBindings(),
    ),

    //----------------------Home screen route------------------
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),

    //----------------------Player screen route------------------

    GetPage(
      name: Routes.playerScreen,
      page: () => const PlayerScreen(),
      binding: PlayerScreenBinding(),
    ),
    //----------------------Survey screen route------------------
    GetPage(
      name: Routes.surveyScreen,
      page: () => const SurveyScreen(),
    ),

    //---------------------Fill survey screen route------------------
    GetPage(
      name: Routes.fillSurveyScreen,
      page: () => const FillSurveyScreen(),
      binding: FillSurveyFormBinding(),
    ),
    //----------------------Reports screen route------------------
    GetPage(
      name: Routes.reportsScreen,
      page: () => const ReportsScreen(),
    ),

    //----------------------User profile screen route------------------
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
    ),
    //----------------------Setting Screen route------------------
   
  ];
}
