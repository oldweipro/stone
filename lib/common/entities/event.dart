class EventItem {
  String? title;
  String? picture;

  EventItem({
    this.title,
    this.picture,
  });

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
        title: json["title"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "picture": picture,
  };
}

class EventPageListRequestEntity {
  String? keyword;
  int? pageNum;
  int? pageSize;

  EventPageListRequestEntity({this.keyword, this.pageNum, this.pageSize});

  Map<String, dynamic> toJson() => {
        "pageNum": pageNum,
        "pageSize": pageSize,
      };
}

class EventPageListResponseEntity {
  int? code;
  String? msg;
  int? counts;
  int? pagesize;
  int? pages;
  int? page;
  List<EventItem>? items;

  EventPageListResponseEntity({
    this.code,
    this.msg,
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  factory EventPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      EventPageListResponseEntity(
          code: json["code"],
          msg: json["msg"],
          counts: json["data"]["counts"],
          pagesize: json["data"]["pagesize"],
          pages: json["data"]["pages"],
          page: json["data"]["page"],
          items: json["data"]["items"] == null
              ? []
              : List<EventItem>.from(
                  json["data"]["items"].map((x) => EventItem.fromJson(x))));
}
