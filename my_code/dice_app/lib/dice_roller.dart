import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
  // State<DiceRoller> createState() {
  //   return _DiceRollerState();
  // }
}

class _DiceRollerState extends State<DiceRoller> {
  // created for memory efficiency
  int currentDiceRoll = 1;
  String activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    setState(() {
      currentDiceRoll =
          randomizer.nextInt(6) + 1; //randomizer replzced Random().
    });

    // print('rollDice');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: rollDice,
          icon: Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),
          color: Colors.white,
          iconSize: 50,
        ),
        // Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(top: 20), // used SizedBox instead
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
     