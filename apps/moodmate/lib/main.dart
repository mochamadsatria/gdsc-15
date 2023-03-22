import 'package:flutter/material.dart';
import 'package:moodmate/screens/chat_room.dart';
import 'package:moodmate/screens/home.dart';
import 'package:moodmate/screens/match_making.dart';
import 'package:moodmate/screens/pet_overview.dart';
import 'package:moodmate/screens/signin.dart';
import 'package:moodmate/screens/splash.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodmate',
      initialRoute: '/splash',
      routes: {
        //'/home': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/pet': (context) => const PetOverviewScreen(),
        '/chat/matchmaking': (context) => const MatchMakingScreen(),
        '/chat/room': (context) => const ChatRoomScreen(),
        '/auth/signin': (context) => const SignInScreen() ,
      },
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
      ),
      home: const SignInScreen(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Socket socket;
//
//   late String roomId;
//
//   @override
//   void initState() {
//     super.initState();
//
//     connectServer();
//   }
//
//   void connectServer() {
//
//     // Ganti dengan wsl ip / host ip
//     socket = io('http://192.168.9.142:3000', {
//       'transports': ['websocket'],
//       'force new connection': true,
//     });
//
//     socket.onConnect((_) {
//       print('connect');
//       socket.emit("login", { "uid": "asfsaaxxcccc" });
//     });
//
//     // socket.onDisconnect((_) => print('disconnect'));
//
//     socket.on('join_room', (response) {
//       print("Joined a room and send dummy message");
//
//       socket.emit("room_ready", { "roomId": response['roomId'] });
//     });
//
//     socket.on("joined_room_and_wait_for_queue", (response) {
//       print("wait for another client to join the room...");
//     });
//
//     socket.on("proceed_to_chat", (response) {
//       print("Actively receive chat...");
//
//       roomId = response['roomId'];
//
//       // send a message to the server
//       socket.emit("message", { "roomId": response['roomId'], "message": "Hello, From another flutter!" });
//     });
//
//     // listen for chat message event
//     socket.on('message', (response) {
//       print('Received message: ${response["message"]} with roomId: ${response["roomId"]}');
//     });
//
//     socket.on('disconnect', (_) {
//       socket.close();
//     });
//   }
//
//   // function to send a chat message
//   void sendMessage() {
//
//     print("SM Clicked");
//
//     socket.emit('message', {"roomId": roomId, "message": 'Hello World from Flutter!'});
//   }
//
//   // function to join a room
//   void joinRoom() {
//     print("Join Clicked");
//     socket.emit("login", { "uid": "asfsaaxxcccc" });
//   }
//
//   void shutDown() {
//     print("SD Clicked");
//     socket.emit("shutdown", { "roomId": roomId });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Socket.io Example'),
//         ),
//         body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   child: Text('Disconnect'),
//                   onPressed: shutDown,
//                 ),
//                 ElevatedButton(
//                   child: Text('Join Room'),
//                   onPressed: joinRoom,
//                 ),
//                 ElevatedButton(
//                   child: Text('Send Message'),
//                   onPressed: sendMessage,
//                 ),
//               ],
//             ),
//             ),
//         );
//     }
// }