import '../../data/models/media_model.dart';

class ArticleEntity {
  final String title;
  final String publishedDate;
  final String source;
  final String abstract;
  final String url;
  final String byline;
  final MediaModel? media;

  ArticleEntity({
    required this.title,
    required this.publishedDate,
    required this.source,
    required this.abstract,
    required this.url,
    required this.byline,
    this.media,
  });
}
