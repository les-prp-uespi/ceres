import 'package:flutter/material.dart';
import './XDTeladeSalas.dart';
import './XDTeladeRecursosMultimdia.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDHome extends StatelessWidget {
  XDHome({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2e75bc),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 0.0),
            child:
                // Adobe XD layer: 'App Bar / Top App B…' (component)
                Container(),
          ),
          Transform.translate(
            offset: Offset(22.0, 94.0),
            child: Text(
              'Bemvindo à Central de Reservas!',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(19.0, 217.0),
            child: Container(
              width: 152.0,
              height: 141.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffa0c3f2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(190.0, 217.0),
            child: Container(
              width: 152.0,
              height: 141.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffa0c3f2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(68.0, 318.0),
            child: SizedBox(
              width: 54.0,
              child: Text(
                'Salas',
                style: TextStyle(
                  fontFamily: '.AppleSystemUIFont',
                  fontSize: 18,
                  color: const Color(0xff221381),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(212.0, 318.0),
            child: SizedBox(
              width: 108.0,
              child: Text(
                'Multimídia',
                style: TextStyle(
                  fontFamily: '.AppleSystemUIFont',
                  fontSize: 18,
                  color: const Color(0xff221381),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 393.0),
            child: Text(
              'Reservas ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 171.0),
            child: Text(
              'Recursos',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(50.31, 237.23),
            child:
                // Adobe XD layer: 'Icon awesome-house-…' (shape)
                SvgPicture.string(
              _svg_uvcj2x,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(19.0, 439.0),
            child:
                // Adobe XD layer: 'Image Lists / Eleme…' (component)
                Container(),
          ),
        ],
      ),
    );
  }
}

const String _svg_uvcj2x =
    '<svg viewBox="50.3 237.2 253.2 65.6" ><path transform="translate(50.31, 237.23)" d="M 44.60189437866211 14.67125129699707 L 10.75854396820068 39.27009963989258 C 10.50765705108643 39.45642471313477 10.18708038330078 39.54320907592773 9.911415100097656 39.69762802124023 L 9.911415100097656 63.29976272583008 C 9.911415100097656 64.42792510986328 11.02027225494385 65.34169006347656 12.38930702209473 65.34169006347656 L 35.50028991699219 65.34169006347656 L 29.73454666137695 56.04964065551758 L 45.85787200927734 47.88192749023438 L 36.5410041809082 32.66701507568359 L 59.46923828125 50.12294387817383 L 43.34591293334961 58.29065704345703 L 49.52825546264648 65.34169006347656 L 76.81448364257812 65.34169006347656 C 78.18351745605469 65.34169006347656 79.29237365722656 64.42792510986328 79.29237365722656 63.29976272583008 L 79.29237365722656 39.70273208618164 C 79.02909851074219 39.55469131469727 78.71626281738281 39.47046279907227 78.47776794433594 39.29434585571289 L 44.60189437866211 14.67125129699707 Z M 88.38158416748047 30.15416717529297 L 79.29237365722656 23.53959655761719 L 79.29237365722656 6.125783920288086 C 79.29237365722656 4.997619152069092 78.18351745605469 4.083856582641602 76.81448364257812 4.083856582641602 L 66.90291595458984 4.083856582641602 C 65.53388214111328 4.083856582641602 64.42502593994141 4.997619152069092 64.42502593994141 6.125783920288086 L 64.42502593994141 12.72248554229736 L 48.7446174621582 1.315768241882324 C 47.5629768371582 0.4402918815612793 46.08243560791016 0.001277457922697067 44.60189437866211 1.253088953490078e-06 C 43.12135314941406 -0.001274951733648777 41.64391326904297 0.4351871013641357 40.46691131591797 1.31066358089447 L 0.8222019672393799 30.15416717529297 C -0.1952820867300034 30.90840148925781 -0.2804596424102783 32.19864654541016 0.6348114609718323 33.03839111328125 L 3.948991060256958 36.07830810546875 C 4.862713813781738 36.91677093505859 6.429979801177979 36.98696899414062 7.449012279510498 36.23272705078125 L 42.9633903503418 10.41765975952148 C 43.90034103393555 9.737442970275879 45.30499649047852 9.737442970275879 46.24194717407227 10.41765975952148 L 81.75632476806641 36.2314567565918 C 82.7738037109375 36.98442077636719 84.341064453125 36.91550064086914 85.25634002685547 36.0770378112793 L 88.57051849365234 33.03711700439453 C 89.48424530029297 32.19865036010742 89.40062713623047 30.90712738037109 88.38158416748047 30.15416717529297 Z" fill="#001f74" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(229.02, 241.75)" d="M 6.205045223236084 14.61243629455566 L 0 14.61243629455566 L 0 29.12798118591309 L 0.03102522529661655 29.12798118591309 L 0 55.25595474243164 C 0 58.44938278198242 2.792270421981812 61.06218338012695 6.205045223236084 61.06218338012695 L 62.05045318603516 61.06218338012695 L 62.05045318603516 55.25595474243164 L 6.205045223236084 55.25595474243164 L 6.205045223236084 14.61243629455566 Z M 68.25550079345703 8.806217193603516 L 43.4353141784668 8.806217193603516 L 37.23027420043945 3 L 18.61513710021973 3 C 15.20236015319824 3 12.44111633300781 5.612797737121582 12.44111633300781 8.806217193603516 L 12.41009044647217 43.64352035522461 C 12.41009044647217 46.83694839477539 15.20236015319824 49.44973754882812 18.61513710021973 49.44973754882812 L 68.25550079345703 49.44973754882812 C 71.66827392578125 49.44973754882812 74.46054840087891 46.83694839477539 74.46054840087891 43.64352035522461 L 74.46054840087891 14.61243629455566 C 74.46054840087891 11.41901588439941 71.66827392578125 8.806217193603516 68.25550079345703 8.806217193603516 Z M 21.7176570892334 40.74041366577148 L 35.67900848388672 23.3217601776123 L 46.53783798217773 36.41477966308594 L 54.29413986206055 27.67642402648926 L 65.15297698974609 40.74041366577148 L 21.7176570892334 40.74041366577148 Z" fill="#001f74" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
