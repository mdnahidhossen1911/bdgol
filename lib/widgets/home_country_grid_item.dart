import 'package:flutter/material.dart';

class CountryGridItem extends StatelessWidget {
  final Map countries;
  const CountryGridItem({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 10 / 6,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              child: Image.network(
                '${countries['flag']}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(height: 4),
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
    );
  }
}
