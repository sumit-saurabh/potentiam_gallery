import 'package:potentiam_gallery/data/network/service_objects/album_photo_response.dart';
import 'package:potentiam_gallery/data/network/service_objects/album_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'album_remote_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class AlbumRemoteApi {
  factory AlbumRemoteApi(Dio dio, {String baseUrl}) = _AlbumRemoteApi;

  @GET("/albums/{id}")
  Future<AlbumResponse> getAlbumById(@Path() int id);

  @GET("/albums")
  Future<List<AlbumResponse>> getAlbums();

  @GET("/albums?title={title}")
  Future<List<AlbumResponse>> getAlbumsByTitle(@Path() String title);

  @GET("/albums/{albumId}/photos")
  Future<List<AlbumPhotoResponse>> getAlbumPhotosByAlbumId(@Path() int albumId);
}