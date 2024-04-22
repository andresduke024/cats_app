class CatWeightResponse {
  String? imperial;
  String? metric;

  CatWeightResponse({this.imperial, this.metric});

  CatWeightResponse.fromMap(Map<String, dynamic> map) {
    imperial = map['imperial'];
    metric = map['metric'];
  }

  factory CatWeightResponse.fromJson(Map<String, dynamic> json) => CatWeightResponse.fromMap(json);
}
