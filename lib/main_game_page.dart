import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import './helpers/direction.dart';
import './helpers/joypad.dart';
import './ray_world.game.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  RayWorldGame game = RayWorldGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
              ),
            )
          ],
        ));
  }

  void onJoypadDirectionChanged(Direction direction) {
    game.onJoypadDirectionChanged(direction);
  }
}
