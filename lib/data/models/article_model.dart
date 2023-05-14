import 'package:ny_times_app/data/models/media_model.dart';
import 'package:ny_times_app/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    required super.title,
    required super.publishedDate,
    required super.source,
    required super.abstract,
    required super.url,
    required super.byline,
    super.media,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    final mediaJson = json['media'] as List<dynamic>;
    return ArticleModel(
      title: json['title'],
      publishedDate: json['published_date'],
      source: json['source'],
      abstract: json['abstract'],
      url: json['url'],
      byline: json['byline'],
      media: mediaJson.isNotEmpty ? MediaModel.fromJson(mediaJson.first) : null,
    );
  }

  static List<ArticleModel> fromList(List<dynamic>? list) =>
      list?.map((e) => ArticleModel.fromJson(e)).toList() ?? [];
}
