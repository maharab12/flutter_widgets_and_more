import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/languages.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: languages(),
      locale: Locale("bn_BD", "bn"),
      fallbackLocale: Locale("en", "us"),
      home: Hi(),
    );
  }
}

class Hi extends StatelessWidget {
  Hi({Key? key});

  void changeLanguage() {
    var currentLocale = Get.locale;
    if (currentLocale == Locale("bn_BD", "bn")) {
      Get.updateLocale(Locale("en", "us"));
    } else {
      Get.updateLocale(Locale("bn_BD", "bn"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("app_name".tr, style: TextStyle(fontSize: 35)),
            Text("app_title".tr, style: TextStyle(fontSize: 35)),
            TextButton(
              onPressed: () {
                changeLanguage();
              },
              child: Text("button".tr, style: TextStyle(fontSize: 25)),
            )
          ],
        ),
      ),
    );
  }
}
