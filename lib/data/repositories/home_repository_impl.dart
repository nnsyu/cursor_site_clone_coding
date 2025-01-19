import '../../domain/repositories/home_repository.dart';
import '../datasources/remote/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> getSomeData() {
    return remoteDataSource.getSomeData();
  }
}
