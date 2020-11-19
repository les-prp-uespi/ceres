class ReservationModel {
  final String data;
  final int resource;
  final bool status;
  final String tStart;
  final String tFinal;

  ReservationModel(
      {this.data, this.resource, this.status, this.tStart, this.tFinal});

  Map<String, dynamic> toJson() {
    return {
      "dia": this.data,
      "inicio": this.tStart,
      "final": this.tFinal,
      "material": this.resource,
      "status": this.status
    };
  }
}
