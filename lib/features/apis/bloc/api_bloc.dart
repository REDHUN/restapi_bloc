import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:restapibloc/features/apis/models/api_data_model.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiInitialFetchEvent>(apiInitialFetchEvent);
  }

  FutureOr<void> apiInitialFetchEvent(
      ApiInitialFetchEvent event, Emitter<ApiState> emit) async {
    var client = http.Client();
    List<ApiDataModel> apis = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        ApiDataModel api =
            ApiDataModel.fromMap(result[i] as Map<String, dynamic>);
        apis.add(api);
      }

      emit(ApiFetchingSuccessful(apis: apis));
    } catch (e) {
      print(e.toString());
    }
  }
}
