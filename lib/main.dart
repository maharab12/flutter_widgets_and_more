import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home.dart';
void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Splash() ,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(pages: [
      PageViewModel(title: "First",
          body: "This is first desctiption",
          image: Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg")
      ),
      PageViewModel(
          title: "First",
          body: "This is first desctiption",
          image:Image.network("https://cdn.pixabay.com/photo/2015/07/09/22/45/tree-838667_1280.jpg")
      ),
      PageViewModel(
          title: "First",
          body: "This is first desctiption",

          image: Image.network("https://cdn.pixabay.com/photo/2018/04/20/09/49/sky-3335585_1280.jpg")
      ),
    ],
      onDone: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));},
      next: Icon(Icons.forward),

      showSkipButton: true,
      skip: Text("Skip"),
      done: Text("Done"),);
  }
}

