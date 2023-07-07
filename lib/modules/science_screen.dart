import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shaerd/components/components.dart';
import '../shaerd/cubit/cubit.dart';
import '../shaerd/cubit/state.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.Get(context).science;
          if (state is NewsgetscienceloadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsgetscienceloadingState) {
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