import 'package:flutter/material.dart';

import '../utils/app_theme_color.dart';

class CountryGridItem extends StatelessWidget {
  final Map countries;
  const CountryGridItem({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColor.flagCircleColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    '${countries["flag"]}',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Text(
              '${countries['name']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            Text(
              '${countries['count']}',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
