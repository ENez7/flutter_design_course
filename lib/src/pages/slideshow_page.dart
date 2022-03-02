import 'package:flutter/material.dart';

import 'package:disenos/src/widgets/slideshow.dart';
import 'package:disenos/src/theme/theme_changer.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(child: MiSlideshow()),
        Expanded(child: MiSlideshow())
      ],
    ));
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondary = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      colorPrimario: appTheme.darkTheme ? secondary : Color(0xffFF5A7E),
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
