import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Splash%20Screen/splashScreen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:movie_app/utilis/app_colors.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (viewModel) => viewModel.StartUp(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/images/movie_app.JPG"),
              width: 400,
              height: 400,
            ),
          ),
        );
      },
    );
  }
}
