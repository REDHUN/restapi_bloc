import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapibloc/features/apis/bloc/api_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiBloc apiBloc = ApiBloc();

  @override
  void initState() {
    apiBloc.add(ApiInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Home Page"),
      ),
      body: BlocConsumer<ApiBloc, ApiState>(
          bloc: apiBloc,
          listenWhen: (previous, current) => current is ApiActionState,
          buildWhen: (previous, current) => current is! ApiActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case ApiFetchingSuccessful:
                final successState = state as ApiFetchingSuccessful;
                return Container(
                  child: ListView.builder(
                      itemCount: successState.apis.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Color.fromARGB(255, 206, 194, 194),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(successState.apis[index].title)],
                          ),
                        );
                      }),
                );
              default:
                return SizedBox();
            }
          }),
    );
  }
}
