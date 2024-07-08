import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = ConfettiController(duration: const Duration(seconds: 5));
  bool isPlaying = false;
  Random random = Random();
  int x = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text('Lottery App')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Lottery Winning Number Is 5',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: x == 5
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                              height: 150,
                              width: 150,
                              image: AssetImage('images/winning.jpg')),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              'Congratulation you have won the Lottery , \n Your number is $x !! ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ConfettiWidget(
                              confettiController: _controller,
                              blastDirection: -pi / 2,
                              colors: const [
                                Colors.green,
                                Colors.blue,
                                Colors.pink,
                                Colors.orange,
                                Colors.purple,
                              ],
                              gravity: 0.01,
                              emissionFrequency: 0.1,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                              height: 50,
                              width: 50,
                              image: AssetImage('images/heart.jpg')),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Better luck next time your number is $x \n try again !! ',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = random.nextInt(6);
            if (x == 5) {
              print('condition match for confetti effect ');
              _controller.play();
            }
            ;
            //isPlaying = !isPlaying;
            setState(() {});
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
