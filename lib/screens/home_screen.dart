import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../time_beater.dart';

class HomeScreen extends StatelessWidget {
  final TimeBeater game;

  HomeScreen(this.game, {super.key});

  void startGame() {
    game.overlays.remove(game.mainMenuOverlayIdentifier);
    game.overlays.add(game.characterSelectionOverlayIdentifier);
    game.inMainMenu = false;
    game.inCharacterSelection = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Align(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/HUD/MainMenu.png',
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
            alignment: Alignment.center,
          ),
          Container(
            height: screenHeight,
            width: screenWidth,
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () => startGame(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350.0, 50.0),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Novo Jogo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}