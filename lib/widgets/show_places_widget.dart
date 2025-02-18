import 'package:flutter/material.dart';
import '../data/places_data.dart';
import '../model/place.dart';
import 'grid_widget.dart';

class ShowPlacesWidget extends StatelessWidget {
  final ValueChanged<Place> onPlaceChanged;
  final bool isHorizontal;

  const ShowPlacesWidget({
    super.key,
    required this.onPlaceChanged,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[200],
        child: GridView.count(
          crossAxisCount: isHorizontal ? 1 : 2,
          scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          // childAspectRatio: 1 / 1.2,
          children: places_data
              .map<Widget>((place) => GridWidget(
                    place: place,
                    onPlaceChanged: onPlaceChanged,
                  ))
              .toList(),
        ),
      );
}
