import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/weather_assets_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 35),
        child: SvgPicture.asset(WeatherAssetsConstants.logo, height: 41),
      ),
      leadingWidth: 76,
      title: Text(
        'Weather',
        style: GoogleFonts.archivo(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Color(0xFF2D3748),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(41);
}
