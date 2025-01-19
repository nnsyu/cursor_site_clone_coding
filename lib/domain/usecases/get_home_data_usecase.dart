import 'package:cursor_clone_coding/core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase implements UseCase<void, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  Future<void> call(NoParams params) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}
