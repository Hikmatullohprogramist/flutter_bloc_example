part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeComplectedState extends HomeState {
  List<UserModel> data;
  HomeComplectedState(this.data);
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}
