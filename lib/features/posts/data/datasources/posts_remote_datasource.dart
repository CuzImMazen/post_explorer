import 'package:post_explorer/core/network/api_routes.dart';
import 'package:post_explorer/core/network/dio_client.dart';
import 'package:post_explorer/features/posts/data/models/comment_model.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';

class PostsRemoteDatasource {
  final DioClient _dioClient;

  PostsRemoteDatasource(this._dioClient);

  Future<List<PostModel>> getPosts() async {
    final response = await _dioClient.get(ApiRoutes.posts);
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }

  Future<List<CommentModel>> getComments(int postId) async {
    final response = await _dioClient.get(ApiRoutes.postComments(postId));
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
