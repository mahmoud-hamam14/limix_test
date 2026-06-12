import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:limix_test/features/ai_models/widget/fish_activity_card.dart';
import 'package:limix_test/features/ai_models/widget/info_card.dart';
import 'package:limix_test/features/camera/view/camera_view.dart';

import '../../../core/constants/custom_appbar.dart';

class BiomassView extends StatelessWidget {
  const BiomassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child:
        CustomAppbar(
          title: 'Biomass & Activity',
          subTitle: 'Real-time monitoring',
          showBackButton: false,
          onTap: () {  },
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          FishActivityCard(image: 'assets/images/fish live.jpg',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraView(),));
              }
          ),
          const SizedBox(height: 16),
          InfoCard(
              icon: Icon(Icons.scale,color: Colors.purple,),
              title: "Total Pond Weight",
              value: "1245 kg"
          ),
          const SizedBox(height: 16),
          InfoCard(
              icon: FaIcon(
                FontAwesomeIcons.fishFins,
                color: Colors.purple,
              ),
              title: "Total Fish Count",
              value: "1200"
          )
        ],
      ),
    );
  }
}
