import 'package:dartz/dartz.dart';

import '../../core/exceptions/server_exception.dart';
import '../../data/models/article_model.dart';

abstract class ArticlesRepository {
  Future<Either<ServerException, List<ArticleModel>>> getArticles();
}
