import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;

  late final screenHeight = MediaQuery.of(context).size.height;
  late final screenWidth = MediaQuery.of(context).size.width;
  late final middleBtnPosition = screenHeight * 0.75;

  void goToPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: onboardingList.length,
            itemBuilder: (_, int itemIndex, int __) => pageItem(itemIndex),
            options: carouselOption(),
          ),
          const Positioned(
            top: 64,
            left: 32,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black45,
            ),
          ),
          Positioned(
            left: screenWidth * 0.25,
            top: middleBtnPosition - 24,
            child: GestureDetector(
              onTap: goToPage,
              child: getStartedBtn(),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 48,
            child: pageIndicator(),
          ),
          const Positioned(
            bottom: 48,
            right: 48,
            child: Text(
              'Log in',
              style: TextStyle(
                color: dashboardSecondary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget pageIndicator() => AnimatedSmoothIndicator(
        count: onboardingList.length,
        activeIndex: activeIndex,
        effect: ExpandingDotsEffect(
          dotColor: Colors.grey[600]!,
          activeDotColor: dashboardSecondary,
          dotHeight: 6,
          dotWidth: 6,
          spacing: 6,
        ),
      );

  Widget pageItem(int index) => Container(
        color: onboardingList[index].color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(onboardingList[index].imagePath)),
            Text(
              onboardingList[index].title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                onboardingList[index].description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: screenHeight - middleBtnPosition),
          ],
        ),
      );

  CarouselOptions carouselOption() => CarouselOptions(
        scrollPhysics: const ClampingScrollPhysics(),
        height: screenHeight,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        onPageChanged: (index, _) => setState(() => activeIndex = index),
        scrollDirection: Axis.horizontal,
      );

  Widget getStartedBtn() => Container(
        padding: const EdgeInsets.all(16),
        width: screenWidth * 0.5,
        child: const Text(
          'Get started',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: dashboardSecondary,
        ),
      );
}
