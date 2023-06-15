import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_music/components/item_album_widget.dart';
import 'package:play_music/pages/detail/music_detail_viewmodel.dart';
import 'package:play_music/pages/detail/widgets/item_music_widget.dart';
import 'package:provider/provider.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../models/album_model.dart';
import '../../models/music_model.dart';

class MusicDetailPage extends StatefulWidget {
  final MusicModel model;
  final AlbumModel albumModel;
  final player = AudioPlayer();


  MusicDetailPage({Key? key, required this.model, required this.albumModel})
      : super(key: key);

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  bool playing = false;

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: ()
            {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Assets.icons.icBack
              .svg(color: Colors.black, width: 10, height: 10),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 29),
              child: Assets.icons.icSearch.svg(),
            )
          ],
          title: Text(
            S.of(context).txt_music_player,
            style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(top: 50, right:250,
                child: Image.asset("assets/images/im_vienvang.png",),),
             Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 340,
                child: ItemAlbumWidget(
                  model: widget.albumModel,
                ))),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 30.0,  right: 10.0),
                child: Selector<MusicDetailVM, List<MusicModel>>(
                  selector: (_, vm) => vm.listViewMusic,
                  shouldRebuild: (data1, data2) => true,
                  builder: (_, data, __) {
                    return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                      return ItemMusicWidget(
                        model: data[index],
                        callback: (MusicModel value) {
                        setState(() {
                        playing = !!playing;
                        });
    },
    );
    },

                    );
                  },
                  ),
                ),
              ),
            ],),

            AnimatedPositioned(
              width: MediaQuery.of(context).size.width,
              height: playing ? 0.0 : 60.0,
              // top: playing ? 0.0 : 150.0,
              bottom: playing ? 0.0 : 0.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(203, 197, 197, 0.51),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/images/im_micro.png',
                              fit: BoxFit.cover,
                            ),
                          )),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lac',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          Text('Rhymastic'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Assets.icons.icBack.svg(),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Assets.icons.icPlay.svg(),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 0),
                            child: Assets.icons.icNext.svg(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}