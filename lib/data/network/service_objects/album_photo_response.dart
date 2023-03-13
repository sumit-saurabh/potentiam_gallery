import 'package:json_annotation/json_annotation.dart';
part 'album_photo_response.g.dart';

@JsonSerializable()
class AlbumPhotoResponse{
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumPhotoResponse({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumPhotoResponse.fromJson(Map<String, dynamic> json) => _$AlbumPhotoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumPhotoResponseToJson(this);
}