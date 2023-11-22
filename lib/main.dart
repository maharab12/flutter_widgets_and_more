import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class AnotherPage extends StatefulWidget {
  final String title;
  AnotherPage(this.title);

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  final videourl="https://youtu.be/YMx8Bbev6T4";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId=YoutubePlayer.convertUrlToId(videourl);
    _controller= YoutubePlayerController(initialVideoId: videoId??'');
    flags:YoutubePlayerFlags(
      autoPlay: false
    );
    super.initState();
  }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'anotherpage.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(

          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.red,
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(35),bottomRight:Radius.circular(35
              ),)
              ),child: Center(
                child: ListTile(
                title: Text("@Hasan Islam"),
                  subtitle: Text("Professional .....",style: TextStyle(fontSize: 20),),
                  trailing: CircleAvatar(
                    radius: 25,
                    backgroundImage: Image.network("https://i.pinimg.com/736x/17/5a/7e/175a7e5aa143451d4029b3bdc4714891.jpg").image,
                  )),
              ),),
            Expanded(child: Container(
              child: GridView.count(crossAxisCount: 2,
              mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [
                  item(context, "Vidoes",Icon(Icons.video_collection)),
                  item(context, "upload flie", Icon(Icons.upload)),
                  item(context,"help", Icon(Icons.upcoming),),
                  item(context,"Upload", Icon(Icons.upload))

                ],

              ),
            ))
          ],
        ),
      ),
    );
  }
}

item(BuildContext context, String title,IconData) {
return GestureDetector(
  onTap:(){ Navigator.push(context,CupertinoPageRoute(builder: (context)=>AnotherPage(title)));},
  child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:300,
        width: 300,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconData,
            Text(title)
          ],
        ),
      ),
    )
);

}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(controller: _controller,
          showVideoProgressIndicator:true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,

            ),
            PlaybackSpeedButton()
          ],
          ),
        ],
      )
    );
  }
}

