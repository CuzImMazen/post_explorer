import 'package:dartz/dartz.dart';
import 'package:post_explorer/core/error/failure.dart';
import 'package:post_explorer/features/posts/data/models/comment_model.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, List<CommentModel>>> getPostComments(int postId);
}
