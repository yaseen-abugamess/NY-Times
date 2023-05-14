import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:ny_times_app/core/constants/constants.dart';
import 'package:ny_times_app/core/utils/http_client.dart';
import 'package:ny_times_app/data/datasources/remote/articles_datasource.dart';

import '../../data/repositories/articles_repository_impl.dart';
import '../../domain/repositories/articles_repository.dart';
import '../../presentation/providers/article_provider.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.allowReassignment = true;

  /// Providers

  sl.registerFactory(() => ArticleProvider());

  /// Repositories

  sl.registerLazySingleton<ArticlesRepository>(
    () => ArticlesRepositoryImpl(dataSource: sl()),
  );

  /// Remote data sources

  sl.registerLazySingleton<ArticlesDataSource>(
    () => ArticlesDataSourceImpl(client: sl()),
  );

  /// Externals

  sl.registerLazySingleton(
    () => HttpClient(host: Constants.baseURL, client: sl()),
  );

  sl.registerLazySingleton(
    () => http.Client(),
  );
}
