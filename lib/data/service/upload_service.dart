import 'package:flutter_tuchapiane_social_network_app/data/service/base_service.dart';

class UploadService extends ServiceBase<String> {
  final String path;

  UploadService(this.path);

  @override
  Future<String> call() async {
    final result = await upload('upload', 'photo', path);
    return result['data']['url'];
  }
}
