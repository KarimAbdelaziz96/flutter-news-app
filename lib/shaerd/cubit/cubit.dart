// ignore_for_file: non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shaerd/cubit/state.dart';
import 'package:news_app2/shaerd/network/local/cash_helper.dart';

import '../../modules/business_screen.dart';
import '../../modules/science_screen.dart';
import '../../modules/sports_screen.dart';
import '../../modules/technology_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsSatates> {
  //  final NewsCubit newsRepository;

  // NewsCubit(this.newsRepository) : super(NewsInitialState());
  NewsCubit(super.initialState);

  int currentindex = 0;

  static NewsCubit Get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    technologyScreen(),
  ];

  List<BottomNavigationBarItem> BottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
        size: 40.0,
      ),
      label: "BUSINESS",
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
          size: 40.0,
        ),
        label: "SPORTS"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
          size: 40.0,
        ),
        label: "science"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.speed_outlined,
          size: 40.0,
        ),
        label: "technology"),
  ];

  void ChangeBottomNavBar(int index) {
    currentindex = index;
    emit(NewsBottomNavState());
    if (index == 1) Getsports();
    if (index == 2) Getscience();
    if (index == 3) Gettechnology();
  }

  List<dynamic> business = [];

  void Getbusiness() {
    emit(NewsgetbusinessloadingState());
    DioHelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'sa',
      'category': 'business',
      'apiKey': '64621f0148ed42dd8bbc931dcc970957',
    }).then((value) {
      // print(value.data['articles'][0]['title']);

      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsgetbusinessSuccessState());
    }).catchError((Error) {
      print(Error.toString());
      emit(NewsgetbusinessErrorrState(Error.toString()));
    });
  }

  List<dynamic> sports = [];

  void Getsports() {
    if (sports.isEmpty) {
      emit(NewsgetsportsloadingState());
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'sa',
        'category': 'sports',
        'apiKey': '64621f0148ed42dd8bbc931dcc970957',
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
      }).catchError((Error) {
        print(Error.toString());
        emit(NewsgetsportsErrorrState(Error.toString()));
      });
    } else {
      emit(NewsgetsportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void Getscience() {
    if (science.isEmpty) {
      emit(NewsgetscienceloadingState());
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'sa',
        'category': 'science',
        'apiKey': '64621f0148ed42dd8bbc931dcc970957',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
      }).catchError((Error) {
        print(Error.toString());
        emit(NewsgetscienceErrorrState(Error.toString()));
      });
    } else {
      emit(NewsgetscienceSuccessState());
    }
  }

  List<dynamic> technology = [];

  void Gettechnology() {
    if (science.isEmpty) {
      emit(NewsgettechnologyloadingState());
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'sa',
        'category': 'technology',
        'apiKey': '64621f0148ed42dd8bbc931dcc970957',
      }).then((value) {
        technology = value.data['articles'];
        print(technology[0]['title']);
      }).catchError((Error) {
        print(Error.toString());
        emit(NewsgettechnologyErrorrState(Error.toString()));
      });
    } else {
      emit(NewsgettechnologySuccessState());
    }
  }

  List<String> titlebar = ["business", "sports", "science", "technology"];

  void changeindex(int index) {
    currentindex = index;
    emit(appbartitle());
  }

  bool isDark = false;

  void changemode({bool? fromshaerd}) {
    if (fromshaerd != null) {
      isDark = fromshaerd;
      emit(appMode(isDark));
    } else {
      isDark = !isDark;

      ChashHelper.putdata(Key: 'isDark', Value: isDark).then((value) {
        emit(appMode(isDark));
      });
      print('Theme mode changed to $isDark');
    }
  }

  List<dynamic> search = [];

  void Getsearch(String value) {
    emit(NewsgetsearchloadingState());

    DioHelper.getdata(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '64621f0148ed42dd8bbc931dcc970957',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
    }).catchError((Error) {
      print(Error.toString());
      emit(NewsgetsearchErrorrState(Error.toString()));
    });

    emit(NewsgetsearchSuccessState());
  }
}
