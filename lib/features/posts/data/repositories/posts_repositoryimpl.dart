import 'package:dartz/dartz.dart';
import 'package:post_explorer/core/error/failure.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
}
