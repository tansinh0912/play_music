import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:music_flutter/models/album_model.dart';

import '../models/album_model.dart';

class ItemAlbumWidget extends StatelessWidget {
  final AlbumModel model;

  const ItemAlbumWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            child: CachedNetworkImage(
              imageUrl: model.image,
              width: double.infinity,
              height: double.infinity,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(114, 237, 241, 241),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              height: 60.0,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      model.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      model.description,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
