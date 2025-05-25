import 'package:tut_app/presentation/base/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
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
}

//orders that our view model will receive from view
abstract class OnboardingViewModelInputs {
  void goNext(); // when user clicks on right arrow  or swip left
  void goPrevious(); //  when user clicks on left arrow  or swip right
  void onPageChanged(int index);
}

abstract class OnboardingViewModelOutputs {}
