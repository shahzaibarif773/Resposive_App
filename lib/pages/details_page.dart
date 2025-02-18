import 'package:responsive_app1/widgets/place_details_widget.dart';
import 'package:flutter/material.dart';

import '../model/place.dart';
import '../theme/app_colors.dart';

class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.purple,
        title: Text(
          place.subtitle,
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
      body: PlaceDetailsWidget(
        place: place,
      ),
    );
  }
}
