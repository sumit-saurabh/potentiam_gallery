import 'package:json_annotation/json_annotation.dart';
part 'album_response.g.dart';

@JsonSerializable()
class AlbumResponse{
  int? id;
  String? title;
  int? userId;

  AlbumResponse({
    this.id,
    this.title,
    this.userId
  });

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => _$AlbumResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumResponseToJson(this);
}