import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

import '../resources/valus_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<SliderObject> _getSliderData() => [
        SliderObject(
          StringsManager.onBoardingTitle1,
          StringsManager.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1,
        ),
        SliderObject(
          StringsManager.onBoardingTitle2,
          StringsManager.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          StringsManager.onBoardingTitle3,
          StringsManager.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3,
        ),
        SliderObject(
          StringsManager.onBoardingTitle4,
          StringsManager.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) => OnBoardingPage(_list[index]),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s80,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  StringsManager.skip,
                  style: TextStyle(),
                  textAlign: TextAlign.end,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s70,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Text(
          _sliderObject.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSize.s70,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(this.title, this.subTitle, this.image);
}
