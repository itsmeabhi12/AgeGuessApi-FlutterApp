import 'dart:convert';

import 'package:jsonplaceholder/Failures/api_not_found_exception.dart';
import 'package:jsonplaceholder/Failures/network_error_exception.dart';
import 'package:jsonplaceholder/model/user.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  final http.Client client;
  RemoteRepository(this.client);
  Future<User?> getAge(name) async {
    try {
      final client = http.Client();
      final http.Response response =
          await client.get(Uri.parse('https://api.agify.io/?name=$name'));
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)['age'] == null) {
          throw ApiNotFoundException('Unable to guess Age');
        }
        return User.fromMap(jsonDecode(response.body));
      } else {
        throw NetworkError("Something went wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
}
