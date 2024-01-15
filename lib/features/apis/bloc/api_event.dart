part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class ApiInitialFetchEvent extends ApiEvent {}

class PostAddEvent extends ApiEvent {}
