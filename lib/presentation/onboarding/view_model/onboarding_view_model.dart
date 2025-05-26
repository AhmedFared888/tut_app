import 'dart:async';

import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // on boarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex] as int,
        _list.length, _currentIndex as SliderObject));
  }

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
}

//orders that our view model will receive from view
abstract class OnboardingViewModelInputs {
  void goNext(); // when user clicks on right arrow  or swip left
  void goPrevious(); //  when user clicks on left arrow  or swip right
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
