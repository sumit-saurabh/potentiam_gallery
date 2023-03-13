import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/domain/entity/album_photo.dart';
import 'package:potentiam_gallery/ui/bloc/album_photo_bloc.dart';
import 'package:potentiam_gallery/ui/factory/bloc_factory.dart';
import 'package:potentiam_gallery/ui/widget/row_album_photo.dart';

class AlbumPhotoWidget extends StatefulWidget {
  final Album album;

  const AlbumPhotoWidget(this.album, {super.key});

  @override
  _AlbumPhotoWidgetState createState() => _AlbumPhotoWidgetState();
}

class _AlbumPhotoWidgetState extends State<AlbumPhotoWidget> {
  final AlbumPhotoBloc _albumPhotoBloc = BlocFactory().get<AlbumPhotoBloc>();
  final _searchController = TextEditingController();

  @override
  void initState() {
    _albumPhotoBloc.add(GetAlbumPhotoEvent(widget.album));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Album: ${widget.album.title}')
      ),
      body: _buildAlbumList(),
    );
  }

  Widget _buildAlbumList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _albumPhotoBloc,
        child: BlocListener<AlbumPhotoBloc, AlbumPhotoState>(
          listener: (context, state) {
            if (state is AlbumPhotoFetchErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<AlbumPhotoBloc, AlbumPhotoState>(
            builder: (context, state) {
              if (state is AlbumPhotoFetchingState) {
                return _buildLoading(state.message?? "Fetching Album Photos...");
              } else if (state is AlbumPhotoFetchedState) {
                return _buildAlbumListView(context, state.albumPhotos!);
              } else if (state is EmptyAlbumPhotoState) {
                return _showMessage(state.message?? "No Photo Found!");
              } else if (state is AlbumPhotoFetchErrorState) {
                return _showMessage(state.message?? "Something went wrong!");
              }
              else {
                return _showMessage("Unknown Event");
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumListView(BuildContext context, AlbumPhotos albumPhotos) {
    return ListView.builder(
      itemCount: albumPhotos.photos!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

          },
          child: AlbumPhotoRowWidget(
            title: albumPhotos.photos![index].title!,
            thumbnailUrl: albumPhotos.photos![index].thumbnailUrl!,
          )
        );
      },
    );
  }


  Widget _buildLoading(String message){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12,),
            Text(message)
          ],
        ));
  }

  Widget _showMessage(String message) {
    return Center(child: Text(message, textAlign: TextAlign.center));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
