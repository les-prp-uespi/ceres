class ResourceModel {
  final int id;
  final String name;
  final String type;

  ResourceModel({
    this.id,
    this.name,
    this.type,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> parsedJson) {
    return ResourceModel(
      id: parsedJson['id'] as int,
      name: parsedJson['name'] as String,
      type: parsedJson['type_material'] as String,
    );
  }
}
