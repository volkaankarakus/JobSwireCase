class NewsModel {
  List<Result>? result;

  NewsModel({this.result});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? key;
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;

  Result(
      {this.key,
        this.url,
        this.description,
        this.image,
        this.name,
        this.source});

  Result.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    description = json['description'];
    image = json['image'];
    name = json['name'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['url'] = this.url;
    data['description'] = this.description;
    data['image'] = this.image;
    data['name'] = this.name;
    data['source'] = this.source;
    return data;
  }
}