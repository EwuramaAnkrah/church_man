import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

class StorageService extends GetxController {
  static final _box = GetSecureStorage();

  Future<void> saveUserToken(String token) async {
    if (token.isNotEmpty) await _box.write('token', token);
  }

  String? getUserToken() {
    return _box.read<String>('token');
  }

  Future<void> removeUserToken() async {
    await _box.remove('token');
  }
}
