// ignore_for_file: camel_case_types, unnecessary_new, unnecessary_this, prefer_collection_literals

class UKStartUp_Model {
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
  bool? isNew;
  bool? isFavorite;

  UKStartUp_Model({
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
    this.isNew = true,
    this.isFavorite = false,
  });

  UKStartUp_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    series = json['series'];
    level = json['level'];
    titleKey = json['title_key'];
    descriptionKey = json['description_key'];
    imageKey = json['image_key'];
    triggerKey = json['trigger_key'];
    rewardType = json['reward_type'];
    rewardValue = json['reward_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isNew = true;
    isFavorite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['series'] = this.series;
    data['level'] = this.level;
    data['title_key'] = this.titleKey;
    data['description_key'] = this.descriptionKey;
    data['image_key'] = this.imageKey;
    data['trigger_key'] = this.triggerKey;
    data['reward_type'] = this.rewardType;
    data['reward_value'] = this.rewardValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'UKStartUp_Model{id: $id, series: $series, level: $level, titleKey: $titleKey, descriptionKey: $descriptionKey, '
        'imageKey: $imageKey, triggerKey: $triggerKey, rewardType: $rewardType, rewardValue: $rewardValue, '
        'createdAt: $createdAt, updatedAt: $updatedAt, isNew: $isNew, isFavorite: $isFavorite}';
  }
}
