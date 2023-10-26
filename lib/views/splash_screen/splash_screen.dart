import 'package:Pam_App/utils/libraries/app_libraries.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  bodyData(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.toNamed(Routes.loginScreen),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.splashScreen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
