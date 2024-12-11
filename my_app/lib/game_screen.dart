import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  final ballGame = BallGame();
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: ballGame);
  }
}

class BallGame with Game {
  late Rect roundPos;
  late double screenWidth, screenHeight, centerX, centerY;
  static final roundWidth = 100.0, roundHeight = 100.0;

  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke;

  int roundDirection = 1;
  static const int roundSpeed = 100;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    screenWidth = window.physicalSize.width / window.devicePixelRatio;
    screenHeight = window.physicalSize.height / window.devicePixelRatio;
    centerX = (screenWidth / 2) - (roundWidth / 2);
    centerY = (screenHeight / 2) - (roundHeight / 2);

    roundPos = Rect.fromLTWH(centerX, centerY, roundWidth, roundHeight);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawOval(roundPos, _paint);
  }

  @override
  void update(double dt) {
    roundPos = roundPos.translate(roundSpeed * roundDirection * dt, 0);
    if (roundDirection == 1 && roundPos.right > screenWidth) {
      roundDirection = -1;
    } else if (roundDirection == -1 && roundPos.left < 0) {
      roundDirection = 1;
    }
  }

  void onTapDown(TapDownDetails details) {
    // Gérer le dessin lorsqu'on appuie sur l'écran
    // Tu peux utiliser les coordonnées details.globalPosition pour déterminer où l'utilisateur a appuyé
  }
}
