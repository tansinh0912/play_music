import 'package:flutter/material.dart';
import '../base/base_page.dart';
import '../components/item_album_widget.dart';
import '../components/item_music_widget.dart';
import '../gen/assets.gen.dart';
import '../generated/l10n.dart';
import 'home_viewmodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinBasePage<HomeVM> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                _scaffoldKey.currentState?.openEndDrawer();
              } else {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              child: Assets.icons.icDrawer.svg(),
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
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(S.of(context).txt_no_data),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          // leading: Container(
          //   margin: const EdgeInsets.only(left: 30),
          //   child: Assets.icons.icDrawer.svg(),
          // ),
          // actions: [
          //   Container(
          //     margin: const EdgeInsets.only(left: 29),
          //     child: Assets.icons.icSearch.svg(),
          //   )
          // ],
          // title: Text(
          //   S.of(context).txt_music_player,
          //   style: const TextStyle(
          //       color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          // ),
        ),
        body: builder(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8.0),
                  child: Text(
                    S.of(context).txt_top_album,
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
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
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, bottom: 0.0),
                  child: Text(
                    S.of(context).txt_recommended,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                  child: ListView.builder(shrinkWrap: true,
                     physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: provider.listViewMusic.length,
                  itemBuilder: (BuildContext context, int index){
                    return ItemMusicWidget(
                      model: provider.listViewMusic[index],
                    );
                  }),
                ))
              ],
            )));
  }

  @override
  HomeVM create() => HomeVM();

  @override
  void initialise(BuildContext context) {}
}


