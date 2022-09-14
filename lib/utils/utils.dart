import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/models/model_mahasiswa.dart';

class Utils {
  static void routerPush(Widget widget, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Mahasiswa m = Mahasiswa(
      namaMhs: 'ammar',
      stbMhs: '1123',
      majorMhs: 'ti',
      genderMhs: 'laki-laki',
      addressMhs: 'Mks');

 var a= Scaffold();
}
