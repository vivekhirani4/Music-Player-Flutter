import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AudioPlayer audioPlayer = AudioPlayer();
  // PlayerState audioPlayerState = PlayerState.paused;

  var image = 'https://w0.peakpx.com/wallpaper/123/984/HD-wallpaper-hanuman-god-jai-shri-ram-lord-hanuman-ram-janki-ram-siya-ram-thumbnail.jpg';
  var music = 'HanumanChalisa.mp3';

  bool isPlaying = false;
  bool audioPlayed = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   audioPlayer.onPlayerStateChanged.listen((PlayerState p) {
  //     setState(() {
  //       audioPlayerState = p;
  //     });
  //    });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 225, 62, 8),
            Color.fromARGB(255, 30, 12, 55)
          ]
        )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const[
                      Icon(Icons.segment_outlined,
                      color: Colors.white,),
                      Text('Music Wings',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 248, 75, 75),
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.person,
                      color: Colors.white,)
                    ],
                  ),
                ),
                 Container(
                  margin: EdgeInsets.only(top: 35),
                  height: 250,
                  width: 200,
                  
                  decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(26)
                  ),
                 )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            if(!isPlaying && !audioPlayed)
            {
              await audioPlayer.play(AssetSource(music));
              setState(() {
                isPlaying = true;
                audioPlayed = true;
              });
            }
            else if(audioPlayed && !isPlaying)
            {
              await audioPlayer.resume();
              setState(() {
                isPlaying = true;
                audioPlayed = true;
              });
            }
            else {
              await audioPlayer.pause();
              setState(() {
                isPlaying = false;
              });
            }
          },
          child: Icon(isPlaying? Icons.pause : Icons.play_arrow),
          backgroundColor: Color.fromARGB(255, 248, 75, 75),
        ),
      ),
    );
  }
}