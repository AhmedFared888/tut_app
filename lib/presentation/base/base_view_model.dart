abstract class BaseViewModel
    implements BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and functions that will be used throw any view model.
}

abstract class BaseViewModelInputs {
  void start(); // start view model jop

  void dispose(); // will be called when view model dies
}

abstract class BaseViewModelOutputs {}
