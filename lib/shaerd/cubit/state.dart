// ignore_for_file: camel_case_types

abstract class NewsSatates {}

class NewsInitialState extends NewsSatates {}

class NewsBottomNavState extends NewsSatates {}

class NewsgetbusinessloadingState extends NewsSatates {}

class NewsgetbusinessSuccessState extends NewsSatates {}

class NewsgetbusinessErrorrState extends NewsSatates {
  final String error;

  NewsgetbusinessErrorrState(this.error);
}

class NewsgetsportsloadingState extends NewsSatates {}

class NewsgetsportsSuccessState extends NewsSatates {}

class NewsgetsportsErrorrState extends NewsSatates {
  final String error;

  NewsgetsportsErrorrState(this.error);
}

class NewsgetscienceloadingState extends NewsSatates {}

class NewsgetscienceSuccessState extends NewsSatates {}

class NewsgetscienceErrorrState extends NewsSatates {
  final String error;

  NewsgetscienceErrorrState(this.error);
}

class NewsgettechnologyloadingState extends NewsSatates {}

class NewsgettechnologySuccessState extends NewsSatates {}

class NewsgettechnologyErrorrState extends NewsSatates {
  final String error;

  NewsgettechnologyErrorrState(this.error);
}

class appbartitle extends NewsSatates {}

class appMode extends NewsSatates {
  final bool isDark;
  appMode(this.isDark);

  // appMode(bool isDark);
}


class NewsgetsearchloadingState extends NewsSatates {}

class NewsgetsearchSuccessState extends NewsSatates {}

class NewsgetsearchErrorrState extends NewsSatates {
  final String error;

  NewsgetsearchErrorrState(this.error);
}

