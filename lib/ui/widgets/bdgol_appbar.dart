import 'package:flutter/material.dart';

import '../utils/app_theme_color.dart';

class BDGOLAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BDGOLAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Row(
        children: [
          Image.network(
            'https://bdgol.com/frontend-assets/assets/img/hero-logo.png',
            width: 35,
          ),
          SizedBox(width: 8),
          Text(
            'BDGOL.COM',
            style: TextStyle(
                fontFamily: "Inter",
                color: AppColor.LabelTextColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
