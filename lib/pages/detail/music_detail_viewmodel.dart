import '../../base/base_viewmodel.dart';
import '../../models/music_model.dart';


class MusicDetailVM extends BaseViewModel {
  List<MusicModel> listViewMusic = [];

  @override
  void onInit() {
    fetchMusicAll();
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
