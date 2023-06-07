import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AlbumModel {
  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  AlbumModel({required this.image,required this.title,required this.description});
}
