import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:time_beater/time_beater.dart';

class JumpButton extends SpriteComponent
    with HasGameRef<TimeBeater>,
        TapCallbacks {

  JumpButton();

  final margin = 32;
  final buttonSize = 64;

  @override
  FutureOr<void> onLoad() {
    priority = 10;
    sprite = Sprite(game.images.fromCache('HUD/JumpButton.png'));
    position = Vector2(
        game.size.x - margin - buttonSize,
        game.size.y- (margin * 2) - (buttonSize * 2),
    );

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.hasJumped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.hasJumped = false;
    super.onTapUp(event);
  }
}