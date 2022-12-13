class TaskItem {
  String? taskName;

  TaskItem({
    this.taskName,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) => TaskItem(
        taskName: json["taskName"],
      );

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
      };
}

class TaskPageListRequestEntity {
  String? keyword;
  int? page;
  int? pageSize;

  TaskPageListRequestEntity({this.keyword, this.page, this.pageSize});

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
      };
}

class TaskPageListResponseEntity {
  int? code;
  String? msg;
  int? counts;
  int? pagesize;
  int? page;
  List<TaskItem>? items;

  TaskPageListResponseEntity({
    this.code,
    this.msg,
    this.counts,
    this.pagesize,
    this.page,
    this.items,
  });

  factory TaskPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      TaskPageListResponseEntity(
          code: json["code"],
          msg: json["msg"],
          counts: json["data"]["total"],
          pagesize: json["data"]["pageSize"],
          page: json["data"]["page"],
          items: json["data"]["list"] == null
              ? []
              : List<TaskItem>.from(
                  json["data"]["list"].map((x) => TaskItem.fromJson(x))));
}
