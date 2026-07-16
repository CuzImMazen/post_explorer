import 'package:get/get.dart';
import 'package:post_explorer/core/network/api_routes.dart';
import 'package:post_explorer/core/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClient(baseUrl: ApiRoutes.baseUrl));
  }
}
