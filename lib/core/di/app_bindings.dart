import 'package:get/get.dart';
import 'package:post_explorer/core/network/api_routes.dart';
import 'package:post_explorer/core/network/dio_client.dart';
import 'package:post_explorer/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClient(baseUrl: ApiRoutes.baseUrl));

    Get.lazyPut<PostsRemoteDatasource>(
      () => PostsRemoteDatasource(Get.find<DioClient>()),
    );

    Get.lazyPut<PostsRepository>(
      () => PostsRepositoryImpl(Get.find<PostsRemoteDatasource>()),
    );
  }
}
