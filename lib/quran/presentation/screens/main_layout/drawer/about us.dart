import 'package:flutter/material.dart';
import 'package:istiqamah/core/resources/color_manager.dart';
import 'package:istiqamah/core/resources/values_manager.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).brightness == Brightness.light ? ColorManager.primaryLight : ColorManager.white,)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Text('hi there my name is fathy tarek and i\'m introducing istiqamah , istiqamah is an islamic application developed by me for non arabic and arabic speakers to give you more understanding of holy quran and for sunnah (in the near future inshallah ), istiqamah is based on ui developed by @tanvir_ux on figma and quran.com v4 API , kindly remember my father and my grandmother in your dua'),
      ),
    );
  }
}
