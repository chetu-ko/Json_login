import 'package:flutter/material.dart';
import 'package:task1/models/model.dart';

Widget getTitleWidgets(List<SubPath> subpaths) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: subpaths.length,
    itemBuilder: (context, index1) {
      return Text(
        subpaths[index1].subTitle + ' --> ',
        style: TextStyle(
          backgroundColor: Colors.black,
          fontSize: 25,
        ),
      );
    },
  );
}
