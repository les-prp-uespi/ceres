import 'package:uespi_reserva/models/resource_model.dart';

class ReservationModel {
  int id;
  final String data;
  final int resource;
  final bool status;
  String tStart;
  String tFinal;
  final ResourceModel resourceModel;

  ReservationModel(
      {this.id,
      this.data,
      this.resource,
      this.status,
      this.tStart,
      this.tFinal,
      this.resourceModel});

  Map<String, dynamic> toJson() {
    return {
      "day": this.data,
      "start": this.tStart,
      "end": this.tFinal,
      "material": this.resource.toString(),
      "status": this.status.toString()
    };
  }

  factory ReservationModel.fromJson(Map<String, dynamic> parsedJson) {
    return ReservationModel(
      id: parsedJson['id'] as int,
      tStart: parsedJson['start'] as String,
      tFinal: parsedJson['end'] as String,
      data: parsedJson['day'] as String,
      resourceModel: ResourceModel.fromJson(parsedJson["material"]),
    );
  }

  toUpdateJson() {
    return {"start": this.tStart, "end": this.tFinal};
  }
}
