class FacebookModel {
  String? name;
  String? email;
  Picture? picture;
  String? id;

  FacebookModel({this.name, this.email, this.picture, this.id});

  FacebookModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Picture {
  Data? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? height;
  String? url;
  int? width;

  Data({this.height, this.url, this.width});

  Data.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}
