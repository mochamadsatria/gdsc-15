import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MatchMakingScreen extends StatefulWidget {
  const MatchMakingScreen({super.key});

  @override
  State<MatchMakingScreen> createState() => _MatchMakingScreenState();
}

class _MatchMakingScreenState extends State<MatchMakingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        //color: Colors.blue, // set the background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              child: Text(
                "Finding you the best partner...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                textAlign: TextAlign.center,
                softWrap: true,
                //overflow: TextOverflow.ellipsis,
              ),
            ),
            Lottie.network('https://assets7.lottiefiles.com/packages/lf20_rlmdrwm8.json'),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
                softWrap: true,
                //overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
