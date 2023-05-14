import 'package:flutter/cupertino.dart';
import 'package:ny_times_app/core/exceptions/server_exception.dart';
import 'package:ny_times_app/data/models/article_model.dart';
import 'package:ny_times_app/domain/repositories/articles_repository.dart';

import '../../core/utils/dependency_injection.dart';
import '../../core/utils/enumeration.dart';

class ArticleProvider with ChangeNotifier {
  final _articleRepo = sl<ArticlesRepository>();
  NotifierSate loading = NotifierSate.initial;
  String? message;
  List<ArticleModel> _articles = [];

  List<ArticleModel> get articles => _articles;

  Future<void> getArticles() async {
    loading = NotifierSate.loading;
    notifyListeners();
    final result = await _articleRepo.getArticles();
    if (result.isLeft()) {
      message = result
          .swap()
          .getOrElse(() => ServerException(message: 'Error occurred'))
          .message;
    }
    _articles = result.getOrElse(() => []);
    loading = NotifierSate.loaded;
    notifyListeners();
  }
}
