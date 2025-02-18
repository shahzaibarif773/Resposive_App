import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/place.dart';

class PlaceDetailsWidget extends StatefulWidget {
  final Place place;
  const PlaceDetailsWidget({super.key, required this.place});

  @override
  State<PlaceDetailsWidget> createState() => _PlaceDetailsWidgetState();
}

class _PlaceDetailsWidgetState extends State<PlaceDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final fontSize = (MediaQuery.of(context).size.width * 0.025);
    return LayoutBuilder(builder: (_, constraints) {
      return MediaQuery.of(context).orientation == Orientation.portrait
          ? buildSmallWidget(context, fontSize, AppColors.purple)
          : buildLargeWidget(context, fontSize, AppColors.purple);
    });
  }

  Widget buildSmallWidget(BuildContext context, double fontSize, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Image.network(
            widget.place.image,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 2,
            fit: BoxFit.cover,
          ),
          buildTitle(fontSize),
          buildButtons(color),
          AutoSizeText(
            minFontSize: 12,
            maxFontSize: 22,
            widget.place.description,
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget buildLargeWidget(BuildContext context, double fontSize, Color color) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    widget.place.image,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 2,
                    fit: BoxFit.fill,
                  ),
                  buildTitle(fontSize),
                ],
              ),
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: buildButtons(color),
                ),
                AutoSizeText(
                  minFontSize: 12,
                  maxFontSize: 18,
                  widget.place.description,
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  buildTitle(double fontSize) {
    return Container(
      padding: EdgeInsets.all(26),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  minFontSize: 16,
                  maxFontSize: 30,
                  widget.place.title,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 8,
                ),
                AutoSizeText(
                  minFontSize: 12,
                  maxFontSize: 22,
                  widget.place.subtitle,
                  style: TextStyle(
                      fontSize: fontSize, color: AppColors.lightblack),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.star, color: Colors.yellow),
          const SizedBox(width: 6),
          const Text('54'),
        ],
      ),
    );
  }

  buildButtons(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(color, Icons.call, 'CALL'),
        buildButton(color, Icons.near_me, 'ROUTE'),
        buildButton(color, Icons.share, 'SHARE'),
      ],
    );
  }

  buildButton(Color color, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: color),
          )
        ],
      ),
    );
  }
}
