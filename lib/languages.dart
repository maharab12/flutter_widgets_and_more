import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/language/bangla.dart';

import 'language/english.dart';
class languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_us":eng,
    "bn_BD":ban

  };

}