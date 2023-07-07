// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/modules/search_screen.dart';
import 'package:news_app2/shaerd/components/components.dart';
import 'package:news_app2/shaerd/cubit/cubit.dart';
import 'package:news_app2/shaerd/cubit/state.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({super.key});

  int currntindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsSatates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.Get(context);
        bool isDark = NewsCubit.Get(context).isDark;

        return Scaffold(
          appBar: AppBar(
              title: Text(
                cubit.titlebar[cubit.currentindex],
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigatto(context, const SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30.0,
                    )),
                IconButton(
                  onPressed: () {
                    print('Button pressed');

                    NewsCubit.Get(context).changemode();
                  },
                  icon: Icon(
                      isDark ? Icons.lightbulb : Icons.lightbulb_outline),
                ),
              ]),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.ChangeBottomNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            items: cubit.BottomItem,
          ),
        );
      },
    );
  }
}
