import 'package:expenz_flutter/constants/colors.dart';
import 'package:expenz_flutter/data/onboarding_page_data.dart';
import 'package:expenz_flutter/screens/onboardings/first_page.dart';
import 'package:expenz_flutter/screens/user_data_page.dart';
import 'package:expenz_flutter/widgets/onboarding_widgets/onboarding_page_card.dart';
import 'package:expenz_flutter/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  //Get All Data from Onborading data.
  final onboardingAllData = OnboardingPageData();

  //page controller
  final PageController _controller = PageController();

  //isEndScreen
  bool isShowEnd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      isShowEnd = value == 3;
                    });
                  },
                  children: [
                    FirstPage(),
                    OnboardingPageCard(
                      image: onboardingAllData.onboardingSampleData[0].image,
                      title: onboardingAllData.onboardingSampleData[0].title,
                      description:
                          onboardingAllData.onboardingSampleData[0].description,
                    ),
                    OnboardingPageCard(
                      image: onboardingAllData.onboardingSampleData[1].image,
                      title: onboardingAllData.onboardingSampleData[1].title,
                      description:
                          onboardingAllData.onboardingSampleData[1].description,
                    ),
                    OnboardingPageCard(
                      image: onboardingAllData.onboardingSampleData[2].image,
                      title: onboardingAllData.onboardingSampleData[2].title,
                      description:
                          onboardingAllData.onboardingSampleData[2].description,
                    ),
                  ],
                ),

                //Page Indicator
                Container(
                  alignment: Alignment(0, 0.60),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: mainColor,
                      dotColor: greyColor,
                    ),
                  ),
                ),

                //Onborading button
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: !isShowEnd
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                              );
                            },
                            child: CustomButton(
                              title: isShowEnd ? "Get Start" : "Next",
                              bgColor: mainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              //Navigator to userdata page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDataPage(),
                                ),
                              );
                            },
                            child: CustomButton(
                              title: isShowEnd ? "Get Start" : "Next",
                              bgColor: mainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
