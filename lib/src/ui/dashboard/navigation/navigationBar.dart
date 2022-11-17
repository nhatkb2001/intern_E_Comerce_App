import 'package:e_comerce_intern_nhat/src/constants/colors.dart';
import 'package:e_comerce_intern_nhat/src/ui/cart/screens/cartScreen.dart';
import 'package:e_comerce_intern_nhat/src/ui/dashboard/dashboard.dart';
import 'package:e_comerce_intern_nhat/src/ui/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class navigationBar extends StatefulWidget {
  navigationBar({
    Key? key,
  }) : super(key: key);
  @override
  _navigationBar createState() => _navigationBar();
}

class _navigationBar extends State<navigationBar>
    with SingleTickerProviderStateMixin {
  // String uid = "";

  // _navigationBar(uid);
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // User? user = FirebaseAuth.instance.currentUser;
    // final userid = user?.uid.toString();
    // uid = userid!;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          atDashboardScreen(),
          atCartScreen(),
          profileCenterScreen(),
        ],
        controller: _tabController,
        //onPageChanged: whenPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 56,
        width: 375 + 24,
        // decoration: BoxDecoration(
        //   border: Border.all(color: white, width: 1),
        // ),
        // padding: EdgeInsets.only(
        //     left: (MediaQuery.of(context).size.width - 375 + 24) / 2,
        //     right: (MediaQuery.of(context).size.width - 375 + 24) / 2),
        child: ClipRRect(
          child: Container(
            color: black,
            child: TabBar(
              labelColor: white,
              unselectedLabelColor: white,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: white, width: 1)),
              //For Indicator Show and Customization
              indicatorColor: violet,
              tabs: const <Widget>[
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbDashboard,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.global, size: 24)),
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbAccountManagement,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.shopping_cart, size: 24)),
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbIncidentReport,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.user_square, size: 32)),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
