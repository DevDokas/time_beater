import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

import '../character/player.dart';

class Level extends World {
  final String levelName;
  final Player player;
  Level({required this.levelName, required this.player});
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async{

    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>("Spawnpoints");

    for(final spawnPoints in spawnPointsLayer!.objects) {
      switch (spawnPoints.class_) {
        case "Player":
          player.position =  Vector2(spawnPoints.x, spawnPoints.y);
          add(player);
          break;
        default:
      }
    }

    return super.onLoad();
  }
}