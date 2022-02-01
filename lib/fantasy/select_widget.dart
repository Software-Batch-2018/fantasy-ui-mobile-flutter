import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/fantasy/controller/global_controller.dart';
import 'package:new_app/fantasy/player_detail.dart';
import 'package:new_app/fantasy/players.dart';

class SelectWidget extends StatelessWidget {
  final String image;
  final String name;
  late String position;
  final double top;
  final double right;
  final double left;
  final int Positionindex;

  SelectWidget(
      {Key? key,
      required this.image,
      required this.left,
      required this.name,
      required this.position,
      required this.right,
      required this.Positionindex,
      required this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> outputList = Players.listPlayers.where((o) {
      return o['Player_position'] == position;
    }).toList();
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.6773399 * _height);

    return Positioned(
      child: SizedBox(
        child: Column(children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
                child: ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 400,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    position,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                ),
                                Column(
                                  children:
                                      List.generate(outputList.length, (index) {
                                    Map<String, Object> data =
                                        outputList[index];
                                    return PlayerDetail(
                                      index: Positionindex,
                                      player: data,
                                      name: data['Player_name'].toString(),
                                      imageUrl: data['Player_image'].toString(),
                                      price: data['Player_price'].toString(),
                                      teamName: data['teamName'].toString(),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  child: Text(
                    name,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                padding: const EdgeInsets.only(left: 5.0, right: 5.0)),
          ),
        ]),
        height: (height + 20.0),
      ),
      top: top,
      right: right,
      left: left,
    );
  }
}
