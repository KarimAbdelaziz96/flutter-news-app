import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shaerd/cubit/cubit.dart';
import 'package:news_app2/shaerd/cubit/state.dart';

import '../shaerd/components/components.dart';

class SearchScreen extends StatelessWidget {
const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
var searchList = NewsCubit.Get(context).search;
    return BlocConsumer<NewsCubit, NewsSatates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.Get(context).Getsearch(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search most not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "search",
                        labelStyle: TextStyle(fontSize: 30.0),
                        prefix: Icon(
                          Icons.search,
                          size: 30.0,
                        )),
                  ),
                ),
          Expanded(child: BuildArticalItem(searchList, context))              ],
            ));
      },
    );
  }
}
