import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_explorer/core/error/failure.dart';
import 'package:post_explorer/core/error/failure_mapper.dart';
import 'package:post_explorer/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:post_explorer/features/posts/data/models/post_model.dart';
import 'package:post_explorer/features/posts/data/repositories/posts_repositoryimpl.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl(this.postsRemoteDatasource);

  final PostsRemoteDatasource postsRemoteDatasource;

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final posts = await postsRemoteDatasource.getPosts();
      return Right(posts);
    } on DioException catch (e) {
      return Left(FailureMapper.fromDio(e));
    } catch (e) {
      return Left(const UnknownFailure('Something went wrong.'));
    }
  }
}
