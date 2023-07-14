
import 'package:http/http.dart' as http;

abstract class CommonRemoteDataSourceContract {
}

class CommonRemoteDataSource implements CommonRemoteDataSourceContract {
  final http.Client client;

  CommonRemoteDataSource({required this.client});

}
