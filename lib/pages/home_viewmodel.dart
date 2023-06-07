
import 'package:play_music/gen/assets.gen.dart';
import '../base/base_viewmodel.dart';
import '../models/album_model.dart';
import '../models/music_model.dart';


class HomeVM extends BaseViewModel {
  List<AlbumModel> listAlbum = [];

    @override
  void onInit() {
      fetchAlbum();
    }


      Future fetchAlbum() async {
        listAlbum.add(AlbumModel(
            title: "HipHop",
            description: "MUSIC",
          image: "assets/images/im_headphone.png"
        ));
        listAlbum.add(AlbumModel(
          title: "Bolera",
          description: "MUSIC",
          image:"assets/images/im_maucam.png"
        ));
        notifyListeners();
      }
  }

