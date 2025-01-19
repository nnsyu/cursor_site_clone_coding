import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/usecases/get_home_data_usecase.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.initial());
}

class HomeState {
  HomeState();

  factory HomeState.initial() => HomeState();
}
