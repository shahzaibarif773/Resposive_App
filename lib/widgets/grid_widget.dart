import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/model/place.dart';
import 'package:responsive_app1/pages/details_page.dart';
import 'package:responsive_app1/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'responsive_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    required this.place,
    required this.onPlaceChanged,
    super.key,
  });

  final Place place;
  final ValueChanged<Place> onPlaceChanged;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.025;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: () {
          final isMobile = ResponsiveWidget.isMobile(context);
          final isTablet = ResponsiveWidget.isTablet(context);

          if (isMobile || isTablet) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(place: place),
            ));
          } else {
            onPlaceChanged(place);
          }
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: AppColors.lightblack,
            title: AutoSizeText(
              place.title,
              minFontSize: 18,
              maxFontSize: 22,
              style: TextStyle(fontSize: fontSize),
            ),
            subtitle: AutoSizeText(
              place.subtitle,
              minFontSize: 14,
              maxFontSize: 16,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          child: Ink.image(image: NetworkImage(place.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
