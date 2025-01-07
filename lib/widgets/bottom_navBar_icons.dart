import 'package:flutter/material.dart';

class NavIcons {
  static const String _assetsPath = 'assets/icons';
  static const double _iconSize = 24;
  static const Color _selectedColor = Colors.orangeAccent;
  static const Color _unSelectedColor = Colors.black54;

  static Image home = _icon('$_assetsPath/home.png');
  static Image homeOutline = _outlineIcon('$_assetsPath/homeOutline.png');

  static Image announcement = _icon('$_assetsPath/announcement.png');
  static Image announcementOutline =
      _outlineIcon('$_assetsPath/announcementOutline.png');

  static Image chating = _icon('$_assetsPath/chatting.png');
  static Image chatingOutline =
      _outlineIcon('$_assetsPath/chattingOutline.png');

  static Image profile = _icon('$_assetsPath/profile.png');
  static Image profileOutline = _outlineIcon('$_assetsPath/profileOutline.png');

  //// nav bar selected icons
  static Image _icon(String icon) {
    return Image.asset(
      icon,
      width: _iconSize,
      height: _iconSize,
      color: _selectedColor,
    );
  }

  //// nav bar unselected icons
  static Image _outlineIcon(String icon) {
    return Image.asset(
      icon,
      width: _iconSize,
      height: _iconSize,
      color: _unSelectedColor,
    );
  }
}
