import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/fantasy/controller/global_controller.dart';
import 'package:new_app/fantasy/players.dart';
import 'package:new_app/fantasy/select_widget.dart';

class FantasyHome extends StatelessWidget {
  const FantasyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.6773399 * _height;

    final globalController = Get.put(GlobalController());

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
          child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.all(24),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    "Spain vs Portugal",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Team Selection",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            Obx(() =>
                                Text("${globalController.playerCount}/7")),
                            Text("Players")
                          ],
                        ),
                      ),
                      Spacer(),
                      Obx(() => Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Text(
                                    "${(globalController.point).toStringAsFixed(1)}"),
                                Text("Budget")
                              ],
                            ),
                          )),
                    ],
                  )
                ],
              )),
          Stack(
            children: [
              Image(
                image: const AssetImage("img/field.png"),
                fit: BoxFit.fill,
                height: _fieldH,
                width: _width,
              ),
              Obx(() {
                return SelectWidget(
                    image: globalController.playersMap[1] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[1]['Player_image'],
                    name: globalController.playersMap[1] == null
                        ? 'GK'
                        : globalController.playersMap[1]['Player_name'],
                    top: 0.07272727 * _fieldH,
                    right: 0.0,
                    left: 0.0,
                    Positionindex: 1,
                    position: "GK");
              }),
              Obx(
                () => SelectWidget(
                    image: globalController.playersMap[2] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[2]['Player_image'],
                    name: globalController.playersMap[2] == null
                        ? 'DF'
                        : globalController.playersMap[2]['Player_name'],
                    top: 0.23636364 * _fieldH,
                    right: 0.43333333 * _width,
                    left: 0.0,
                    Positionindex: 2,
                    position: "DF"),
              ),
              Obx(
                () => SelectWidget(
                    image: globalController.playersMap[3] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[3]['Player_image'],
                    name: globalController.playersMap[3] == null
                        ? 'DF'
                        : globalController.playersMap[3]['Player_name'],
                    top: 0.23636364 * _fieldH,
                    right: 0.0,
                    Positionindex: 3,
                    left: 0.43333333 * _width,
                    position: "DF"),
              ),
              Obx(
                () => SelectWidget(
                    image: globalController.playersMap[4] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[4]['Player_image'],
                    name: globalController.playersMap[4] == null
                        ? 'MF'
                        : globalController.playersMap[4]['Player_name'],
                    top: 0.47272727 * _fieldH,
                    right: 0.0,
                    Positionindex: 4,
                    left: 0.47666667 * _width,
                    position: "MF"),
              ),
              Obx(
                () => SelectWidget(
                    image: globalController.playersMap[5] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[5]['Player_image'],
                    name: globalController.playersMap[5] == null
                        ? 'MF'
                        : globalController.playersMap[5]['Player_name'],
                    top: 0.47272727 * _fieldH,
                    right: 0.47666667 * _width,
                    left: 0.0,
                    Positionindex: 5,
                    position: "MF"),
              ),
              Obx(
                () => SelectWidget(
                    image: globalController.playersMap[6] == null
                        ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                        : globalController.playersMap[6]['Player_image'],
                    name: globalController.playersMap[6] == null
                        ? 'FW'
                        : globalController.playersMap[6]['Player_name'],
                    top: 0.69090909 * _fieldH,
                    right: 0.44 * _width,
                    left: 0.0,
                    Positionindex: 6,
                    position: "FW"),
              ),
              Obx(() => SelectWidget(
                  image: globalController.playersMap[7] == null
                      ? 'https://www.pngkey.com/png/full/398-3983644_premier-league-football-kits.png'
                      : globalController.playersMap[7]['Player_image'],
                  name: globalController.playersMap[7] == null
                      ? 'FW'
                      : globalController.playersMap[7]['Player_name'],
                  top: 0.69090909 * _fieldH,
                  left: 0.47333333 * _width,
                  right: 0.0,
                  Positionindex: 7,
                  position: "FW")),
            ],
          )
        ],
      )),
    );
  }
}
