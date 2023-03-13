// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumPhotoResponse _$AlbumPhotoResponseFromJson(Map<String, dynamic> json) =>
    AlbumPhotoResponse(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$AlbumPhotoResponseToJson(AlbumPhotoResponse instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
