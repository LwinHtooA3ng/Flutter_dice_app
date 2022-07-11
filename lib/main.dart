import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee App',
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text("Dice App"),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _dice = [1, 2, 3, 4, 5, 6];

  int _dice1 = 6;
  int _dice2 = 6;

  String _winner = "";

  void _dice1Roll() {
    setState(() {
      _dice.shuffle();
      _dice1 = _dice[0];
    });
  }

  void _dice2Roll() {
    setState(() {
      _dice.shuffle();
      _dice2 = _dice[0];
    });
  }

  void _check() {
    setState(() {
      if (_dice1 > _dice2) {
        _winner = "Player 1 win!";
        var snackbar = SnackBar(
          duration: const Duration(seconds: 1),
          content: const Text(
            'Player 1 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        _dice1 = 6;
        _dice2 = 6;
      } else if (_dice2 > _dice1) {
        _winner = "Player 2 win!";
        var snackbar = SnackBar(
          duration: const Duration(seconds: 1),
          content: const Text(
            'Player 2 win!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        _dice1 = 6;
        _dice2 = 6;
      } else {
        _winner = "Roll again!";
        var snackbar = SnackBar(
          duration: const Duration(seconds: 1),
          content: const Text(
            'Draw',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        _dice1 = 6;
        _dice2 = 6;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text("Player 1",
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        _dice1Roll();
                      },
                      child: Image.asset(
                        'images/dice$_dice1.png',
                        width: 100,
                        height: 100,
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                const Text("Player 2",
                    style: TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        _dice2Roll();
                      },
                      child: Image.asset(
                        'images/dice$_dice2.png',
                        width: 100,
                        height: 100,
                      ),
                    ))
              ],
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              _check();
            },
            style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
            child: const Text("Check who win!")),
      ],
    );
  }
}
