import 'package:flutter/material.dart';
import 'package:task1/models/model.dart';

Widget getpathWidgets(List<SubPath> subpaths) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: subpaths.length,
    itemBuilder: (context, index1) {
      return Image(image: NetworkImage(subpaths[index1].subImage));
    },
  );
}
