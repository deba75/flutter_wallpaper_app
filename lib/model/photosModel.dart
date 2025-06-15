class PhotosModel {
  String imgSrc;
  String PhotoName;
  PhotosModel({
    required this.imgSrc,
    required this.PhotoName,
  });
  static PhotosModel fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotosModel(
        PhotoName: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}
