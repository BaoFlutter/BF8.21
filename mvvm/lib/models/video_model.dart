class VideoModel {
  /*
  {
 "id": 391,
"title": "Cùng Giải Trí Với Ron Nhé",
"author": "Ron English",
"description": "<p>H&atilde;y để thời gian thật chất lượng để xem hoạt h&igrave;nh v&agrave; luyện tập tiếng anh c&ugrave;ng RON nh&eacute;!</p>",
"id_category": 6,
"name_category": "RonKids 1",
"information_category": "RonKids 1 có thể được sử dụng trong 21 ngày nhằm kích hoạt vùng ngôn ngữ của trẻ. \r\nRonEnglish 1 đã chia nội dung theo các tệp tài liệu folder theo ngày. Mỗi ngày có 3 loại tài liệu như sau: \r\n- Audio nghe ban ngày và nghe vô thức khi đi ngủ\r\n- Video xem ban ngày khi trẻ thoải mái và sẵn sàng học tập\r\n- Songs bài hát nghe mỗi ngày nhằm tăng cường tình yêu ngôn ngữ và cảm nhận vẻ đẹp ngôn ngữ.",
"type": "TakCharge",
"url_video": "http://api.zmax.vn/storage/videos/up_thu_cong/unit-1.mov",
"url_youtube": null,
"url_photo": "http://api.zmax.vn/storage/images/u1aMEC3eWQ3tlQGzzK8Pz0Bq48kXELO5ZYy2NG9q.png",
"week_day_number": "1"
}
   */
  int? id;
  String? title;
  String? author;
  String? description;
  int? id_category;
  String? name_category;
  String? information_category;
  String? type;
  String? url_video;
  String? url_youtube;
  String? url_photo;
  String? week_day_number;

  VideoModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.id_category,
    required this.name_category,
    required this.information_category,
    required this.type,
    required this.url_video,
    required this.url_youtube,
    required this.url_photo,
    required this.week_day_number,
  });

  VideoModel.fromJson(Map json):
        this.id = json['id'],
        this.title = json['title'],
        this.author = json['author'],
        this.description = json['description'],
        this.id_category = json['id_category'],
        this.name_category = json['name_category'],
        this.information_category = json['information_category'],
        this.type = json['type'],
        this.url_video = json['url_video'],
        this.url_youtube = json['url_youtube'],
        this.url_photo = json['url_photo'],
        this.week_day_number = json['week_day_number'];


  toJson(){
    return {
      "id": this.id,
      "title": this.title,
      "author": this.author,
      "description": this.description,
      "id_category": this.id_category,
      "name_category": this.name_category,
      "information_category": this.information_category,
      "type": this.type,
      "url_video": this.url_video,
      "url_youtube": this.url_youtube,
      "url_photo": this.url_photo,
      "week_day_number": this.week_day_number,
    };
  }

}

/*

class VideoModel {
    int? id;
    String? title;
    String? author;
    String? description;
    int? idCategory;
    String? nameCategory;
    String? informationCategory;
    String? type;
    String? urlVideo;
    dynamic? urlYoutube;
    String? urlPhoto;
    String? weekDayNumber;

    VideoModel({this.id, this.title, this.author, this.description, this.idCategory, this.nameCategory, this.informationCategory, this.type, this.urlVideo, this.urlYoutube, this.urlPhoto, this.weekDayNumber});

    VideoModel.fromJson(Map<String, dynamic> json) {
        if(json["id"] is int)
            this.id = json["id"];
        if(json["title"] is String)
            this.title = json["title"];
        if(json["author"] is String)
            this.author = json["author"];
        if(json["description"] is String)
            this.description = json["description"];
        if(json["id_category"] is int)
            this.idCategory = json["id_category"];
        if(json["name_category"] is String)
            this.nameCategory = json["name_category"];
        if(json["information_category"] is String)
            this.informationCategory = json["information_category"];
        if(json["type"] is String)
            this.type = json["type"];
        if(json["url_video"] is String)
            this.urlVideo = json["url_video"];
        this.urlYoutube = json["url_youtube"];
        if(json["url_photo"] is String)
            this.urlPhoto = json["url_photo"];
        if(json["week_day_number"] is String)
            this.weekDayNumber = json["week_day_number"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["id"] = this.id;
        data["title"] = this.title;
        data["author"] = this.author;
        data["description"] = this.description;
        data["id_category"] = this.idCategory;
        data["name_category"] = this.nameCategory;
        data["information_category"] = this.informationCategory;
        data["type"] = this.type;
        data["url_video"] = this.urlVideo;
        data["url_youtube"] = this.urlYoutube;
        data["url_photo"] = this.urlPhoto;
        data["week_day_number"] = this.weekDayNumber;
        return data;
    }
}
 */