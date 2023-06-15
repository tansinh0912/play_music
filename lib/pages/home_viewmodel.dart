import '../base/base_viewmodel.dart';
import '../models/album_model.dart';
import '../models/music_model.dart';

class HomeVM extends BaseViewModel {
  List<AlbumModel> listAlbum = [];
  List<MusicModel> listViewMusic = [];

  @override
  void onInit() {
    fetchAlbumAll();
    fetchMusicAll();
  }

  Future fetchAlbumAll() async {
    listAlbum.add(AlbumModel(
        id: 0,
        title: "HipHop",
        description: "MUSIC",
        image: "assets/images/im_headphone.png"));
    listAlbum.add(AlbumModel(
        id: 1,
        title: "Bolero",
        description: "MUSIC",
        image: "assets/images/im_maucam.png"));
    listAlbum.add(AlbumModel(
        id: 2,
        title: "HipHop",
        description: "MUSIC",
        image: "assets/images/im_headphone.png"));
    listAlbum.add(AlbumModel(
        id: 3,
        title: "Bolero",
        description: "MUSIC",
        image: "assets/images/im_maucam.png"));
    notifyListeners();
  }

  Future<void> fetchMusicAll() async {
    listViewMusic.clear();
    listViewMusic.add(MusicModel(
        id: 1,
        type: 0,
        title: 'Lac',
        description: 'MUSIC',
        time: '30.3',
        author: 'Rhymastic',
        imageUrl: 'assets/images/im_micro.png',
        pathMusic: 'Lac.mp3',
        isLoadSound: true));

    listViewMusic.add(MusicModel(
        id: 2,
        type: 0,
        title: 'Khi Phai Quen Di',
        description: 'MUSIC',
        time: '30.3',
        author: 'Phan Manh Quynh',
        imageUrl: 'assets/images/im_disk.png',
        pathMusic: 'khi_phai_quen_di.mp3',
        isLoadSound: false));

    listViewMusic.add(MusicModel(
        id: 3,
        type: 0,
        title: 'Nang Tho',
        description: 'MUSIC',
        time: '30.3',
        author: 'Hoang Dung',
        imageUrl: 'assets/images/im_color.png',
        pathMusic: 'nang_tho.mp3',
        isLoadSound: false));
    listViewMusic.add(MusicModel(
        id: 4,
        type: 0,
        title: 'Tri Ky',
        description: 'MUSIC',
        time: '30.3',
        author: 'Phan Manh Quynh',
        imageUrl: 'assets/images/im_disk.png',
        pathMusic: 'nang_tho.mp3',
        isLoadSound: false));

    notifyListeners();
  }
}
