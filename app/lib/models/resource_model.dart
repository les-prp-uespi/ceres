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
      name: parsedJson['nome'] as String,
      type: parsedJson['tipo'] as String,
    );
  }
}
