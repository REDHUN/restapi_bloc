import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restapibloc/features/apis/models/api_data_model.dart';
import 'package:restapibloc/features/apis/repos/post_repo.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiInitialFetchEvent>(apiInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> apiInitialFetchEvent(
      ApiInitialFetchEvent event, Emitter<ApiState> emit) async {
    emit(ApiFetchingLoadingState());
    try {
      List<ApiDataModel> apis = await PostRepp.fetchPost();

      emit(ApiFetchingSuccessful(apis: apis));
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<ApiState> emit) async {
    bool sucess = await PostRepp.addPost();
    print(sucess);
    if (sucess) {
      emit(PostAdditionSuccessState());
    } else {
      emit(PostAdditionErrorState());
    }
  }
}
