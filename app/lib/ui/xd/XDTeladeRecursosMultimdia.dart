import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/specific_rect_clip.dart';

class XDTeladeRecursosMultimdia extends StatelessWidget {
  XDTeladeRecursosMultimdia({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff296cb1),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 0.0),
            child:
                // Adobe XD layer: 'App Bar / Top App B…' (component)
                Container(),
          ),
          Transform.translate(
            offset: Offset(17.0, 72.0),
            child: Text(
              'Disponíveis Hoje',
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
            offset: Offset(17.0, 342.0),
            child: Text(
              'Indisponíveis Hoje',
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
            offset: Offset(19.0, 112.0),
            child:
                // Adobe XD layer: 'Image Lists / Eleme…' (none)
                SpecificRectClip(
              rect: Rect.fromLTWH(0, 0, 316, 203),
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 316,
                  height: 400,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(0),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7879,
                    children: [
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Datashow 3',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Datashow 2',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Subtitle 1',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Subtitle 1',
                      },
                    ].map((map) {
                      final fill = map['fill'];
                      final text = map['text'];
                      return Transform.translate(
                        offset: Offset(-464.0, -362.0),
                        child: Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(464.0, 362.0),
                              child:
                                  // Adobe XD layer: 'Image Lists / Eleme…' (component)
                                  Stack(
                                children: <Widget>[
                                  // Adobe XD layer: 'datashow-preto' (shape)
                                  Container(
                                    width: 156.0,
                                    height: 198.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fill,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0.0, 150.0),
                                    child:
                                        // Adobe XD layer: 'Image Lists / Eleme…' (component)
                                        Stack(
                                      children: <Widget>[
                                        // Adobe XD layer: 'Box' (shape)
                                        Container(
                                          width: 156.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x66000000),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(16.0, 13.0),
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 16,
                                              color: const Color(0xffffffff),
                                              letterSpacing:
                                                  0.15360000610351562,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(120.0, 12.0),
                                          child:
                                              // Adobe XD layer: 'Icon / Favorite / F…' (component)
                                              Stack(
                                            children: <Widget>[
                                              // Adobe XD layer: 'Box' (shape)
                                              Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                              ),
                                              Transform.translate(
                                                offset: Offset(2.0, 3.0),
                                                child:
                                                    // Adobe XD layer: 'Icon / Favorite' (shape)
                                                    SvgPicture.string(
                                                  _svg_ezs9r9,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(19.0, 412.0),
            child:
                // Adobe XD layer: 'Image Lists / Eleme…' (none)
                SpecificRectClip(
              rect: Rect.fromLTWH(0, 0, 316, 203),
              child: UnconstrainedBox(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 316,
                  height: 400,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.all(0),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7879,
                    children: [
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Datashow 1',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Datashow 4',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Subtitle 1',
                      },
                      {
                        'fill': const Color(0x80ffffff),
                        'text': 'Subtitle 1',
                      },
                    ].map((map) {
                      final fill = map['fill'];
                      final text = map['text'];
                      return Transform.translate(
                        offset: Offset(-464.0, -362.0),
                        child: Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(464.0, 362.0),
                              child:
                                  // Adobe XD layer: 'Image Lists / Eleme…' (component)
                                  Stack(
                                children: <Widget>[
                                  // Adobe XD layer: 'datashow-branco' (shape)
                                  Container(
                                    width: 156.0,
                                    height: 198.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: fill,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0.0, 150.0),
                                    child:
                                        // Adobe XD layer: 'Image Lists / Eleme…' (component)
                                        Stack(
                                      children: <Widget>[
                                        // Adobe XD layer: 'Box' (shape)
                                        Container(
                                          width: 156.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x66000000),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(16.0, 13.0),
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 16,
                                              color: const Color(0xffffffff),
                                              letterSpacing:
                                                  0.15360000610351562,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(120.0, 12.0),
                                          child:
                                              // Adobe XD layer: 'Icon / Favorite / F…' (component)
                                              Stack(
                                            children: <Widget>[
                                              // Adobe XD layer: 'Box' (shape)
                                              Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                              ),
                                              Transform.translate(
                                                offset: Offset(2.0, 3.0),
                                                child:
                                                    // Adobe XD layer: 'Icon / Favorite' (shape)
                                                    SvgPicture.string(
                                                  _svg_ezs9r9,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ezs9r9 =
    '<svg viewBox="2.0 3.0 20.0 18.3" ><path transform="translate(-352.0, 1418.0)" d="M 364 -1396.650024414062 L 362.5499877929688 -1397.969970703125 C 357.3999938964844 -1402.640014648438 354 -1405.719970703125 354 -1409.5 C 354 -1412.579956054688 356.4200134277344 -1415 359.5 -1415 C 361.239990234375 -1415 362.9100036621094 -1414.18994140625 364 -1412.910034179688 C 365.0899963378906 -1414.18994140625 366.760009765625 -1415 368.5 -1415 C 371.5799865722656 -1415 374 -1412.579956054688 374 -1409.5 C 374 -1405.719970703125 370.6000061035156 -1402.640014648438 365.4500122070312 -1397.9599609375 L 364 -1396.650024414062 Z" fill="#ffffff" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
