

import 'loding_now.dart';

import 'package:flutter/material.dart';


InputDecoration my_TextField_decoration (hint_text,raidos_circuler,borderSide_color,borderSide_color_infocus,add_decoration_or_no) {
  // Color borderSide_color_infocus;
  // Color borderSide_color;
  double _raidos_circuler = raidos_circuler == "default" ? 32 : raidos_circuler  ;
  return InputDecoration(
    hintText: hint_text,
    // labelStyle: TextStyle(color:Colors.black ),
    // fillColor: Colors.black,


    hintStyle: TextStyle(color: Colors.black26),

    suffixIcon: null,


    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: add_decoration_or_no ? OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ): null,
    enabledBorder: add_decoration_or_no ? OutlineInputBorder(
      borderSide: BorderSide(color: borderSide_color, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ) : null,
    focusedBorder: add_decoration_or_no ? OutlineInputBorder(
      borderSide: BorderSide(color: borderSide_color_infocus, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(_raidos_circuler)),
    ): null,
  );
}
