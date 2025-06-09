class Data {
  String? id;
  String? series;
  num? level;
  String? titleKey;
  String? descriptionKey;
  String? imageKey;
  String? triggerKey;
  String? rewardType;
  num? rewardValue;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.series,
    this.level,
    this.titleKey,
    this.descriptionKey,
    this.imageKey,
    this.triggerKey,
    this.rewardType,
    this.rewardValue,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    String? id,
    String? series,
    num? level,
    String? titleKey,
    String? descriptionKey,
    String? imageKey,
    String? triggerKey,
    String? rewardType,
    num? rewardValue,
    String? createdAt,
    String? updatedAt,
  }) => Data(
    id: id ?? this.id,
    series: series ?? this.series,
    level: level ?? this.level,
    titleKey: titleKey ?? this.titleKey,
    descriptionKey: descriptionKey ?? this.descriptionKey,
    imageKey: imageKey ?? this.imageKey,
    triggerKey: triggerKey ?? this.triggerKey,
    rewardType: rewardType ?? this.rewardType,
    rewardValue: rewardValue ?? this.rewardValue,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["series"] = series;
    map["level"] = level;
    map["title_key"] = titleKey;
    map["description_key"] = descriptionKey;
    map["image_key"] = imageKey;
    map["trigger_key"] = triggerKey;
    map["reward_type"] = rewardType;
    map["reward_value"] = rewardValue;
    map["created_at"] = createdAt;
    map["updated_at"] = updatedAt;
    return map;
  }

  Data.fromJson(dynamic json) {
    id = json["id"];
    series = json["series"];
    level = json["level"];
    titleKey = json["title_key"];
    descriptionKey = json["description_key"];
    imageKey = json["image_key"];
    triggerKey = json["trigger_key"];
    rewardType = json["reward_type"];
    rewardValue = json["reward_value"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }
}

class ModelApi {
  List<Data>? dataList;

  ModelApi({this.dataList});

  ModelApi copyWith({List<Data>? dataList}) =>
      ModelApi(dataList: dataList ?? this.dataList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ModelApi.fromJson(dynamic json) {
    if (json != null) {
      dataList = [];
      json.forEach((v) {
        dataList?.add(Data.fromJson(v));
      });
    }
  }
}
