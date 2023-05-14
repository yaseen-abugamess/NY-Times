import 'package:dartz/dartz.dart';
import 'package:ny_times_app/core/constants/constants.dart';
import 'package:ny_times_app/data/models/article_model.dart';

import '../../../core/exceptions/server_exception.dart';
import '../../../core/utils/http_client.dart';

abstract class ArticlesDataSource {
  Future<Either<ServerException, List<ArticleModel>>> getArticles();
}

class ArticlesDataSourceImpl implements ArticlesDataSource {
  final HttpClient client;

  ArticlesDataSourceImpl({
    required this.client,
  });

  @override
  Future<Either<ServerException, List<ArticleModel>>> getArticles() async {
    final res = await client.get(
      path:
          'svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=${Constants.apiKey}',
    );
    if (res is ServerException) {
      return Left(res);
    }
    return Right(ArticleModel.fromList(res['results']));
  }
}
