import 'package:flutter/material.dart';
import 'package:uespi_reserva/materiais/auditorio.dart';
import 'package:uespi_reserva/materiais/datashow.dart';
import 'package:uespi_reserva/materiais/labinfo.dart';
import 'package:uespi_reserva/materiais/salareuniao.dart';

//Variaveis de endereçamento

int index = 0;
int index1 = 0;
int index2 = 0;
int index3 = 0;
int index4 = 0;

class Escolha extends StatefulWidget {
  @override
  _EscolhaState createState() => _EscolhaState();
}

class _EscolhaState extends State<Escolha> {
  @override
  Widget build(BuildContext context) {
    switch(index) {
      case 0:
        return Container();
      case 1:
        return DataShowReserv();
        break;
      case 2:
        return AuditorioReserv();
        break;
      case 3:
        return LabInfoReserv();
        break;
      case 4:
        return SalaReuniaoReserv();
        break;
    }
  }
}
class Escolha1 extends StatefulWidget {
  @override
  _Escolha1State createState() => _Escolha1State();
}

class _Escolha1State extends State<Escolha1> {
  @override
  Widget build(BuildContext context) {
    switch(index1) {
      case 0:
        return Container();
      case 1:
        DataShowReserv DataS1 = new DataShowReserv();
        return DataS1;
        break;
      case 2:
        return AuditorioReserv();
        break;
      case 3:
        return LabInfoReserv();
        break;
      case 4:
        return SalaReuniaoReserv();
        break;
    }
  }
}
class Escolha2 extends StatefulWidget {
  @override
  _Escolha2State createState() => _Escolha2State();
}

class _Escolha2State extends State<Escolha2> {
  @override
  Widget build(BuildContext context) {
    switch(index2) {
      case 0:
        return Container();
      case 1:
        return DataShowReserv();
        break;
      case 2:
        return AuditorioReserv();
        break;
      case 3:
        return LabInfoReserv();
        break;
      case 4:
        return SalaReuniaoReserv();
        break;
    }
  }
}
class Escolha3 extends StatefulWidget {
  @override
  _Escolha3State createState() => _Escolha3State();
}

class _Escolha3State extends State<Escolha3> {
  @override
  Widget build(BuildContext context) {
    switch(index3) {
      case 0:
        return Container();
      case 1:
        return DataShowReserv();
        break;
      case 2:
        return AuditorioReserv();
        break;
      case 3:
        return LabInfoReserv();
        break;
      case 4:
        return SalaReuniaoReserv();
        break;
    }
  }
}
class Escolha4 extends StatefulWidget {
  @override
  _Escolha4State createState() => _Escolha4State();
}

class _Escolha4State extends State<Escolha4> {
  @override
  Widget build(BuildContext context) {
    switch(index4) {
      case 0:
        return Container();
      case 1:
        return DataShowReserv();
        break;
      case 2:
        return AuditorioReserv();
        break;
      case 3:
        return LabInfoReserv();
        break;
      case 4:
        return SalaReuniaoReserv();
        break;
    }
  }
}



