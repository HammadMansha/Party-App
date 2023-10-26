import 'package:Pam_App/utils/libraries/app_libraries.dart';


class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.allButtonsColor,
      ),
    );
  }
}
