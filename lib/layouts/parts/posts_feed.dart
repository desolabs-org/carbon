import 'package:flutter/material.dart';

class PostsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Header")
                    ],
                  ),
                  Expanded(
                      child: Row(
                        children: [
                          Text("Content")
                        ],
                      )
                  )
                ],
              ),
            )
          );
        },
      physics: BouncingScrollPhysics(),
      itemExtent: 100,
      padding: EdgeInsets.all(2),
        itemCount: 100,
      shrinkWrap: false,
    );
  }
}