import 'package:flutter/material.dart';
import 'package:hotel_go/feature/splash/presentation/widgets/sliding_text.dart';
import '../../../../core/app_route/routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  void initSlidingAnimation()  {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),

    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds:1200),
          () {
        Navigator.of(context).pushNamed(AppRoutes.homeScreen);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
