import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/data/places_data.dart';
import 'package:responsive_app1/model/place.dart';
import 'package:responsive_app1/theme/app_colors.dart';
import 'package:responsive_app1/widgets/gallery_widget.dart';
import 'package:responsive_app1/widgets/place_details_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Place selectedPlace = places_data[0];
  void changePlace(Place place) => setState(() => selectedPlace = place);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final fontSize =
        (MediaQuery.of(context).size.width * 0.02).clamp(16.0, 32.0);
    final isMobile = ResponsiveWidget.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.grey,
      drawer: isMobile
          ? Drawer(backgroundColor: AppColors.grey, child: DrawerWidget())
          : null,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.purple,
        title: AutoSizeText(
          minFontSize: 10,
          maxFontSize: 18,
          'Tour With Us',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ),
      body: ResponsiveWidget(
          mobile: buildMobile(w, h, fontSize),
          tablet: buildTablet(w, h, fontSize),
          desktop: buildDesktop()),
    );
  }

  buildMobile(double w, double h, double fontSize) {
    return GalleryWidget(
      onPlaceChanged: changePlace,
    );
  }

  buildTablet(double w, double h, double fontSize) {
    return Row(
      children: [
        const Expanded(flex: 2, child: DrawerWidget()),
        Expanded(
          flex: 5,
          child: GalleryWidget(
            onPlaceChanged: changePlace,
          ),
        ),
      ],
    );
  }

  buildDesktop() {
    return Row(
      children: [
        Expanded(child: DrawerWidget()),
        Expanded(flex: 3, child: buildBody()),
      ],
    );
  }

  Widget buildBody() => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GalleryWidget(
                onPlaceChanged: changePlace,
                isHorizontal: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(flex: 2, child: PlaceDetailsWidget(place: selectedPlace))
          ],
        ),
      );
}
