import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/cubit/home/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return _scaffold(context, state);
      },
    );
  }

  _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloC CUBIT API EXAMPLE"),
      ),
      body: Builder(
        builder: (context) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is HomeComplectedState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = state.data[index];

                return Card(
                  child: ListTile(title: Text(data.username)),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
