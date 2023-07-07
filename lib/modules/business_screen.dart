import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shaerd/cubit/cubit.dart';
import 'package:news_app2/shaerd/cubit/state.dart';

import '../shaerd/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.Get(context).business;
          if (state is List) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsgetbusinessloadingState) {
            return BuildArticalItem(list);
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  BuildArticalItem(list[index]),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: list.length,
            );
          }
        });
  }
}
