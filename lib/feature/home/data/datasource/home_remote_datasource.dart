
import 'package:http/http.dart' as http;


abstract class HomeRemoteDataSourceContract {
  
}

class HomeRemoteDataSource implements HomeRemoteDataSourceContract {
  final http.Client client;

  HomeRemoteDataSource({required this.client});

  
}
