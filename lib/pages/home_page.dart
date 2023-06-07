import 'package:flutter/material.dart';

import '../base/base_page.dart';

import '../components/item_album_widget.dart';
import '../gen/assets.gen.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinBasePage<HomeVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Assets.icons.icDrawer.svg(),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 29),
              child: Assets.icons.icSearch.svg(),
            )
          ],
          title: const Text(
            "Music Player",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        body: builder(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8.0),
                  child: Text(
                    "Top Album",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Padding(padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.listAlbum.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemAlbumWidget(
                          model: provider.listAlbum[index],
                        );
                      },
                    ),
                ),)
              ],
            )));
  }

  @override
  HomeVM create() => HomeVM();

  @override
  void initialise(BuildContext context) {}
}
