import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/model/user_model.dart';
import 'package:flutter_bloc_example/service/remote_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUser();
  }

  // Logic HERE .........

  void getUser() async {
    emit(HomeLoadingState());
    await RemoteService.getUsers().then((value) {
      if (value is List<UserModel>) {
        emit(HomeComplectedState(value));
      } else {
        emit(HomeErrorState(value));
      }
    });
  }
}
