import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/fantasy/controller/global_controller.dart';

class PlayerDetail extends StatelessWidget {
  final String name;
  final Map<String, Object> player;
  final String imageUrl;
  final String price;
  final int index;
  final String teamName;

  const PlayerDetail(
      {Key? key,
      required this.index,
      required this.name,
      required this.player,
      required this.teamName,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalController = Get.put(GlobalController());

    return Container(
      margin: EdgeInsets.all(6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    teamName,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                        color: Colors.black),
                  ),
                ],
              )),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              "\$ ${price} M",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
            ),
          ),
          IconButton(
              onPressed: () {
                globalController.addPlayers(player, index);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
    );
  }
}
