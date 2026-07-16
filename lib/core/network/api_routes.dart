class ApiRoutes {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String posts = '/posts';
  static String postComments(int postId) => '/posts/$postId/comments';
}
