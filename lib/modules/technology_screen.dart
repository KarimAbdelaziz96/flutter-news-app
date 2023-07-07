// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shaerd/cubit/cubit.dart';

import '../shaerd/components/components.dart';

import '../shaerd/cubit/state.dart';

class technologyScreen extends StatelessWidget {
  const technologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<NewsCubit, NewsSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.Get(context).technology;
          if (state is NewsgettechnologyloadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsgettechnologyloadingState) {
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
