import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jsonplaceholder/Repository/remote_repo.dart';
import 'package:jsonplaceholder/model/user.dart';

class Repository {
  final RemoteRepository remoteRepository;
  Repository(this.remoteRepository);
  Future<User?> getData(String name) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return remoteRepository.getAge(name);
    }
  }
}
