class Reserva{
  int idReserva;
  int idUsuario;
  int idRecurso;
  String horarioInicio;
  String horarioFinal;
  String data;
  String nomeMaterial;
  String tipoMAterial;

  Reserva({this.idReserva, this.idUsuario, this.idRecurso,
    this.horarioInicio, this.horarioFinal, this.data, this.nomeMaterial, this.tipoMAterial});

}