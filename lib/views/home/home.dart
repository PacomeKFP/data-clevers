import 'package:flutter/material.dart';

import 'components/components.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            CustomNavigationBar(),//will be replaced by a bottomnav on mobile
            // Column(
            //   children: [
                /**Here we will add a little nav, it will contain :
                 * 
                 * The Drawer iconButton that will allow to sho or hide the sidenav
                 * the Search bar // just an Icon for mobile
                 * Notifications IconButton // (in mobile --> sidenav)
                 * Settings IconButton  // not for mobile (on mobile we will add it in the sideNav)
                 * 
                 * User profile (image & UserName if the is space for it)
                 * 
                 */
                Dashboard(),
              // ],
            // ),
          ],
        ),
      ),
    );
  }
}
