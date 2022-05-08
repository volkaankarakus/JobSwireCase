enum LottieItems{ themeChange,loading }

extension LottieItemsExtension on LottieItems{
  String _path(){
    switch(this){
      case LottieItems.themeChange :
        return 'lottie_theme_change';
      case LottieItems.loading :
        return 'lottie_loading';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}