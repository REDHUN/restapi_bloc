import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiInitialFetchEvent>(apiInitialFetchEvent);
  }

  FutureOr<void> apiInitialFetchEvent(
      ApiInitialFetchEvent event, Emitter<ApiState> emit) async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      print(response.body);
    } catch (e) {}
  }
}
