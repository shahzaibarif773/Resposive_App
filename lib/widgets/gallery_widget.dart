import 'package:responsive_app1/data/places_data.dart';
import 'package:responsive_app1/widgets/grid_widget.dart';
import 'package:flutter/material.dart';

import '../model/place.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget(
      {super.key, this.isHorizontal = false, required this.onPlaceChanged});
  final bool isHorizontal;
  final ValueChanged<Place> onPlaceChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: isHorizontal ? 1 : 2,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: places_data
            .map<Widget>((Place) =>
                GridWidget(onPlaceChanged: onPlaceChanged, place: Place))
            .toList(),
      ),
    );
  }
}
