import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Constant/colors.dart';
import '../../Constant/Strings/onboarding_data..dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  bool islastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: islastpage
              ? MaterialButton(
                  height: 50,
                  minWidth: 200,
                  elevation: 10,
                  color: primaryColor,
                  textColor: Colors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  child:
                      const Text('لننضم الآن', style: TextStyle(fontSize: 20)),
                  onPressed: () => Navigator.pushNamed(context, 'signup'))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, 'signup'),
                        child: const Text(
                          'تخطي',
                          style: TextStyle(fontSize: 20),
                        )),
                    SmoothPageIndicator(
                      onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                      controller: pageController,
                      count: controller.items.length,
                      effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          activeDotColor: primaryColor),
                    ),
                    TextButton(
                        onPressed: () => pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                        child: const Text(
                          'التالي',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: PageView.builder(
              onPageChanged: (index) => setState(() {
                    islastpage = controller.items.length - 1 == index;
                  }),
              controller: pageController,
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.items[index].image,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.items[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(controller.items[index].description,
                            textAlign: TextAlign.center,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.grey))
                      ],
                    ),
                  ],
                );
              }),
        ));
  }
}
