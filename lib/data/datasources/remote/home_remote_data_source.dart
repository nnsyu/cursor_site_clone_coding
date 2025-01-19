abstract class HomeRemoteDataSource {
  Future<void> getSomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<void> getSomeData() async {
    // TODO: implement getSomeData
    throw UnimplementedError();
  }
}
