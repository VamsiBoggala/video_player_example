import 'package:flutter/material.dart';
import 'package:video_player_example/smaple_file.dart';

const urlYoutubeVideo = 'https://youtube.com/watch?v=HSAa9yi0OMA';
final urlLandscapeVideo =
    'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const SamplePlayer(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      // body: buildPages(),
    );
  }

  Widget bottomBar(){

    const style = TextStyle(color: Colors.black);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: index,
      items: const [
         BottomNavigationBarItem(
          icon: Text('VideoPlayer', style: style),
          title: Text('Basics'),
        ),
         BottomNavigationBarItem(
          icon: Text('VideoPlayer', style: style),
          title: Text('Orientation'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index ),
    );
  }
  
//   Widget buildPages(){
//     switch(index) {
//       case 0:
//       return BasicsPage();
//       case 1:
//       return OreintationPage();
//       default:
//       return Container();
//     }
//   }
}