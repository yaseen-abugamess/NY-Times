import 'package:dartz/dartz.dart';
import 'package:ny_times_app/core/exceptions/server_exception.dart';
import 'package:ny_times_app/data/datasources/remote/articles_datasource.dart';
import 'package:ny_times_app/data/models/article_model.dart';

import '../../domain/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesDataSource dataSource;
  ArticlesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ServerException, List<ArticleModel>>> getArticles() async {
    return dataSource.getArticles();
    ;
  }
}
