import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/logic/localData/shared_pref.dart';
import 'package:gym_app/routes/app_router.dart';
import 'package:gym_app/routes/screen_name.dart';
import 'package:gym_app/service_locator.dart';
import 'package:gym_app/sheared/widget/customAppBar.dart';
import 'package:gym_app/sheared/widget/custom_button.dart';


class WorkOurScreen extends StatelessWidget {
  const WorkOurScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Workout! 💪🏼',
        subTitle: 'Let’s do it!',
        onTap: (){},
      ),
      body: Center(
          child: CustomButtonWidget(
            onPressed: ()async{
              sl<SharedPrefController>().removeUser();
              await FirebaseAuth.instance.signOut();
              sl<AppRouter>().goToAndRemove(screenName: ScreenName.loginScreen);
            },
            title: 'LogOut',
          )
      ),
    );
  }
}
