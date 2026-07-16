import 'package:get/get.dart';
import 'package:post_explorer/core/network/dio_client.dart';
import 'package:post_explorer/features/posts/controller/posts_controller.dart';
import 'package:post_explorer/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repository_impl.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsRemoteDatasource>(
      () => PostsRemoteDatasource(Get.find<DioClient>()),
    );

    Get.lazyPut<PostsRepository>(
      () => PostsRepositoryImpl(Get.find<PostsRemoteDatasource>()),
    );

    Get.lazyPut<PostsController>(
      () => PostsController(Get.find<PostsRepository>()),
    );
  }
}
