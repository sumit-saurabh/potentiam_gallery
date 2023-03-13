import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potentiam_gallery/domain/entity/album.dart';
import 'package:potentiam_gallery/ui/bloc/album_bloc.dart';
import 'package:potentiam_gallery/ui/factory/bloc_factory.dart';
import 'package:potentiam_gallery/ui/widget/album_filter_widget.dart';
import 'package:potentiam_gallery/ui/widget/album_photo_widget.dart';
import 'package:potentiam_gallery/ui/widget/row_album.dart';

class AlbumListingWidget extends StatefulWidget {
  const AlbumListingWidget({super.key});

  @override
  _AlbumListingWidgetState createState() => _AlbumListingWidgetState();
}

class _AlbumListingWidgetState extends State<AlbumListingWidget> {
  final AlbumBloc _albumBloc = BlocFactory().get<AlbumBloc>();
  final _searchController = TextEditingController();

  @override
  void initState() {
    _albumBloc.add(GetAlbumsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sumit Saurabh Gallery')),
      body: _buildAlbumList(),
    );
  }

  Widget _buildAlbumList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _albumBloc,
        child: BlocListener<AlbumBloc, AlbumState>(
          listener: (context, state) {
            if (state is AlbumErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<AlbumBloc, AlbumState>(
            builder: (context, state) {
              if (state is AlbumFetchingState) {
                return _buildLoading(state.message?? "Fetching Albums...");
              } else if (state is AlbumFetchedState) {
                return _buildAlbumListView(context, state.albums!);
              } else if (state is EmptyAlbumState) {
                return _showMessage(state.message?? "No Album Found!");
              } else if (state is AlbumErrorState) {
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

  Widget _buildAlbumListView(BuildContext context, List<Album> albums) {
    return Column(
      children: [
        _getFilterWidget(),
        Expanded(
            child: ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumPhotoWidget(albums[index]),
                      ),
                    );
                  },
                  child: AlbumRowWidget(
                      title: albums[index].title!
                  ),
                );
              },
            )
        ),
      ],
    );
  }

  Widget _getFilterWidget() {
    return AlbumFilterWidget(
      hintText: "Filter Album by Title",
      buttonText: "Search",
      searchController: _searchController,
      onPressSearch: (searchText) {
        _albumBloc.add(GetAlbumsEvent(filterTitle: searchText));
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
    return Column(
      children: [
        _getFilterWidget(),
        const SizedBox(height: 30,),
        Center(child: Text(message, textAlign: TextAlign.center,)),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
