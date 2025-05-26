// on boarding models

class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  final SliderObject sliderObject;
  final int numOfSlides;
  final int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
