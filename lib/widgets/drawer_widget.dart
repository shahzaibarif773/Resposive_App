import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_app1/data/all_states.dart';
import 'package:responsive_app1/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = (MediaQuery.of(context).size.width * 0.025);
    return ListView.builder(
        itemCount: allStates.length,
        itemBuilder: (context, index) {
          return index == 0
              ? buildHeader(fontSize)
              : buildMenuItem(index, fontSize);
        });
  }

  buildHeader(double fontsize) {
    return DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/5e/84/76/count-the-jeeps-on-lake.jpg?w=1200&h=700&s=1'))),
        child: Container(
          alignment: AlignmentDirectional.bottomStart,
          child: AutoSizeText(
            minFontSize: 18,
            maxFontSize: 26,
            'Pakistan',
            style: TextStyle(
                fontSize: fontsize,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ));
  }

  buildMenuItem(int index, double fontsize) {
    return ListTile(
      leading: Icon(Icons.location_city),
      title: AutoSizeText(
        minFontSize: 16,
        maxFontSize: 20,
        allStates[index],
        style: TextStyle(fontSize: fontsize),
      ),
    );
  }
}
