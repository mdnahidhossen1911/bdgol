import 'package:flutter/material.dart';

class ProviderListViewItme extends StatelessWidget {
  final Map providerMap;
  const ProviderListViewItme({super.key, required this.providerMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.orangeAccent.shade100,
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent.shade100,
              maxRadius: 35,
              backgroundImage: NetworkImage(
                '${providerMap["image"]}',
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  providerMap['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.orange,
                      size: 18,
                    ),
                    Text(
                      providerMap['location'],
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'View Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      minimumSize: Size(100, 32)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
