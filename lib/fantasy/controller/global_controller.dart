import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_app/fantasy/players.dart';

class GlobalController extends GetxController {
  var point = 22.0.obs;
  var playerCount = 0.obs;

  var _players = {}.obs;

  var _country_map = {};

  var _trackingMap = {}.obs;

  void addPlayers(Map<String, Object> player, index) {
    if (_country_map[player['teamName']] == 4) {
      Get.snackbar("Maximum player selected",
          "You can only select maximum 4 players from one country");
    } else {
      if (point.value - double.parse(player['Player_price'].toString()) < 0) {
        Get.snackbar("Over Budget",
            "Please keep on track at your budget too while building team",
            duration: Duration(seconds: 5));
      } else {
        if (_country_map[player['teamName']] == null) {
          _country_map[player['teamName']] = 1;
        } else {
          _country_map[player['teamName']]++;
        }
        if (_trackingMap[index] != null) {
          _country_map[_trackingMap[index]['teamName']]--;

          point.value = (point.value + _trackingMap[index]['Player_price']) -
              double.parse(player['Player_price'].toString());
          Players.listPlayers.remove(player);
          Players.listPlayers.add(_trackingMap[index]);
          _trackingMap[index] = player;
          _players.remove(_trackingMap[index]);
        } else {
          playerCount.value = playerCount.value + 1;
          Players.listPlayers.remove(player);
          _trackingMap[index] = player;
          point.value =
              point.value - double.parse(player['Player_price'].toString());
        }
      }
    }

    print(_country_map);
  }

  get totalPlayer => _players.length.toString();

  get playersMap => _trackingMap;
}
