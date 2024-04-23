class CatImageResponse {
  String? id;
  String? url;
  int? width;
  int? height;

  CatImageResponse({this.id, this.url, this.width, this.height});

  factory CatImageResponse.fromMap(Map<String, dynamic> map) => CatImageResponse(
        id: map['id'],
        url: map['url'],
        width: map['width'],
        height: map['height'],
      );
}
