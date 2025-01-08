import 'package:flutter/material.dart';

import '../utils/app_theme_color.dart';

class FeaturedProviderListviewItem extends StatelessWidget {
  const FeaturedProviderListviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double rating = 4;

    int count = 5;

    return Container(
      width: 310,
      height: double.maxFinite,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 3,
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildProviderBanner(), //image Network
          _buildFeaturedChip(), //chip
          _buildStarRating(rating), //rating star & rating text
          _buildProviderProfileImage(), // image Network
          _buildProviderNameAndService(count), // text & divider & gridview
          _buildViewProfileButton(), // divider & button
        ],
      ),
    );
  }

  Widget _buildProviderBanner() {
    return Container(
      margin: EdgeInsets.all(12),
      height: 110,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          'https://bdgol.com/media/providers/66d341b58273d.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFeaturedChip() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'FEATURED',
        style: TextStyle(
          color: AppColor.LabelTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    return Padding(
      padding: const EdgeInsets.only(top: 90, left: 16),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.white,
                size: 24.0,
              );
            }),
          ),
          SizedBox(width: 4),
          Text(
            "($rating)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProviderProfileImage() {
    return Container(
      margin: EdgeInsets.only(top: 86, left: 210),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://bdgol.com/media/providers/66d341b57486e.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  Padding _buildProviderNameAndService(int count) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 135,
        left: 16,
        right: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 72),
            child: Text(
              'HUT BAZA',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Divider(height: 1),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 32,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            primary: false,
            shrinkWrap: true,
            itemCount: count >= 4 ? 4 : count, // if lenth up to 4 then set 4
            itemBuilder: (context, index) {
              return _gridviewServiceItem(index);
            },
          ),
        ],
      ),
    );
  }

  Row _gridviewServiceItem(int index) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/icon_done.png',
          width: 16,
          color: AppColor.themeColor,
        ),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            "Service ${index + 1}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Align _buildViewProfileButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Divider(height: 1),
          ),
          SizedBox(height: 7),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.themeColor,
                  minimumSize: Size(140, 40)),
              child: const Text(
                'View Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 7),
        ],
      ),
    );
  }
}
