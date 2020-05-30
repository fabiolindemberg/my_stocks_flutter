class OnBoardingItem {
  String image;
  String primaryText;
  String secondaryText;
  Button button;

  OnBoardingItem(this.image, this.primaryText, this.secondaryText, this.button);
}

class Button {
  String label;
  Function onClick;
  Button(this.label, this.onClick);
}