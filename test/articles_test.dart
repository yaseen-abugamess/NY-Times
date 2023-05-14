import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_app/core/constants/constants.dart';
import 'package:ny_times_app/core/exceptions/server_exception.dart';
import 'package:ny_times_app/core/utils/http_client.dart';
import 'package:ny_times_app/data/datasources/remote/articles_datasource.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late ArticlesDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ArticlesDataSourceImpl(client: mockHttpClient);
  });

  final articlesTestList = [
    {
      'title': 'Test Title 1',
      'published_date': DateTime.now().toString(),
      'source': 'Test Source 1',
      'abstract': 'Test Abstract 1',
      'url': 'Test Url 1',
      'byline': 'Test Byline 1',
      'media': [],
    },
    {
      'title': 'Test Title 2',
      'published_date': DateTime.now().toString(),
      'source': 'Test Source 2',
      'abstract': 'Test Abstract 2',
      'url': 'Test Url 2',
      'byline': 'Test Byline 2',
      'media': [],
    },
  ];

  test(
    'should return a list of articles when the call to HttpClient is successful',
    () async {
      when(mockHttpClient.get(
        path:
            'svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=${Constants.apiKey}',
      )).thenAnswer((_) async => {'results': articlesTestList});

      // act
      final result = await dataSource.getArticles();

      // assert
      expect(result, Right(result.getOrElse(() => [])));
    },
  );

  test(
    'should return a ServerException when the call to HttpClient is unsuccessful',
    () async {
      final testException = ServerException(message: 'Server Error');
      when(mockHttpClient.get(
        path:
            'svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=${Constants.apiKey}',
      )).thenAnswer((_) async => testException);

      // act
      final result = await dataSource.getArticles();

      // assert
      expect(result, Left(result.swap().getOrElse(() => testException)));
    },
  );
}
