import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_music/models/music_model.dart';

import '../gen/assets.gen.dart';
import '../models/album_model.dart';
import '../pages/detail/music_detail_page.dart';

class ItemMusicWidget extends StatelessWidget {

  final MusicModel model;

  const ItemMusicWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MusicDetailPage(
                  model: model,
                  albumModel: AlbumModel(
                      id: 0,
                      title: 'HIP HOP',
                      description: 'MUSIC',
                      image: 'assets/images/im_headphone.png'),
                )),
          );
        },
    child: Container(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Card(
          shadowColor: Colors.grey,
              child: CachedNetworkImage(
            imageUrl: model.imageUrl ?? '',
                 placeholder: (context, url) => const CircularProgressIndicator(),
                 errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
              Text(
              model.title ?? " No Data",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
             Text(model.author ?? "No Data"),
          ],
        ),
           Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text(model.time ?? "00.00")),
           Container(
            margin: const EdgeInsets.only(left: 75),
            child: Assets.icons.icDot.svg()),
            Container(
            margin: const EdgeInsets.only(left: 75, right: 25),
              child: Assets.icons.icOptions.svg()),
      ],
    ),
    ],
    ),
    ));
  }
}
