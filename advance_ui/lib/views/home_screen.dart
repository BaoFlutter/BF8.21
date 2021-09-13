import 'package:advance_ui/resources/constants.dart';
import 'package:advance_ui/resources/widgets/buttons.dart';
import 'package:advance_ui/resources/widgets/description.dart';
import 'package:advance_ui/resources/widgets/image_widget.dart';
import 'package:advance_ui/resources/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen  extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            // cover_image
            ImageWidget(assetLink: IMAGE_LINK),
            // label widget
            LabelWidget(),
            // button widget
            Buttons(),
            // description
            Description(text: "Oeschinen Lake or Oeschinensee or Lago di Oeschinen,"
                " with pristine nature and turquoise blue waters, is literally heaven on earth."
                " High mountains rise on all sides of the lake. And Oeschinensee is like a sparkling gem in the centre."
                " The lake is at the foot of Mountains – Blüemlisalp, Oeschinenhorn, Fründenhorn and Doldenhorn. Osechinen Lake is fed by underwater streams as well as glacial waterfalls falling from the top of these mountains. Make sure to check the webcam for weather conditions before you go here. "
                "And by the way, Oeschinen Lake is part of the UNESCO World Heritage Sites list."
                ),

          ],
        ),
      ),
    );
  }
}
