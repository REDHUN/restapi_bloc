part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

abstract class ApiActionState extends ApiState {}

final class ApiFetchingLoadingState extends ApiState {}

final class ApiFetchingSuccessful extends ApiState {
  final List<ApiDataModel> apis;

  ApiFetchingSuccessful({required this.apis});
}

class PostAdditionSuccessState extends ApiActionState {}

class PostAdditionErrorState extends ApiActionState {}
