import 'package:flutter/material.dart';
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
      body: const Center(child: Text('Api Body')),
    );
  }
}
