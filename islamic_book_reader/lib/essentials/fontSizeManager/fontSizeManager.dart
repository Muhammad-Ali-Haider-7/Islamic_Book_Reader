class FontSizeManager{
  static final FontSizeManager _fontSizeManager = FontSizeManager._internal();
  
  factory FontSizeManager() {
    return _fontSizeManager;
  }
  
  FontSizeManager._internal();

  static int heading = 26;
  static int content = 20;
  static int arabic = 16;

  static void setHeading({required int value}){
    heading = value;
  }

  static void setContent({required int value}){
    content = value;
  }

  static void setArabic({required int value}){
    arabic = value;
  }


}