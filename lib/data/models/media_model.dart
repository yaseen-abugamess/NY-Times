import 'package:ny_times_app/domain/entity/media_entity.dart';

class MediaModel extends MediaEntity {
  MediaModel({
    required super.type,
    required super.copyRight,
    required super.thumbnail,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        type: json['type'],
        copyRight: json['copyright'],
        thumbnail: json['media-metadata'][0]['url'],
      );
}
