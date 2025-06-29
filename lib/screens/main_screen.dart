import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:isupply/bloc/cubit.dart';
import 'package:isupply/bloc/states.dart';
import '../shared/constants.dart';
import 'home_screen.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
      },
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'assets/isupplylogo.png',
                height: 50.h,
                width: 130.w,
              ),
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 55.h),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h, left: 15.w, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Container(
                            height: 50.h,
                            child: SearchBar(
                              hintText: 'Search for Product',
                              trailing: [
                                Icon(
                                  Icons.search,
                                  size: 30.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50.r,
                            height: 50.r,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.document_scanner_rounded,
                                color: white,
                              ),
                              iconSize: 25.r,
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 50.r,
                            height: 50.r,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.attach_file,
                                color: white,
                              ),
                              iconSize: 25.r,
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 28.r,
                      ),
                      if (cubit.notifications > 0)
                        Positioned(
                          right: 9.w,
                          top: -6.h,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: badgeColor,
                              shape: BoxShape.circle,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 10.r,
                              minHeight: 10.r,
                            ),
                            child: Center(
                              child: cubit.notifications > 9 ?
                              Text(
                                '9+',
                                style: TextStyle(
                                  fontFamily: "Cairo",
                                  color: white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ) :
                              Padding(
                                padding: EdgeInsets.all(2.r),
                                child: Text(cubit.notifications.toString(),
                                style:TextStyle(
                                fontFamily: "Cairo",
                                color: white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,), textAlign: TextAlign.center,
                                ),
                              ),

                            ),
                          ),
                        ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                  ),
                ),
              ],
            ),
            body: HomeScreen(),
            floatingActionButton: SpeedDial(
              icon: Icons.chat,
              activeIcon: Icons.close,
              backgroundColor: cornflowerBlue,
              foregroundColor: Colors.white,
              buttonSize:  Size(75.r, 75.r),
              childrenButtonSize: Size(70.r, 70.r),
              visible: true,
              closeManually: false,
              curve: Curves.bounceIn,
              overlayColor: Colors.black,
              overlayOpacity: 0.1,
              children: [
                SpeedDialChild(
                  shape: const CircleBorder(),
                  child: Icon(Icons.call,size: 30.r,),
                  backgroundColor: cornflowerBlue,
                  foregroundColor: Colors.white,
                  onTap: () {
                    print('Call Tapped');
                  },
                ),
                SpeedDialChild(
                  shape: const CircleBorder(),
                  child: Icon(Icons.chat_bubble,size: 30.r,),
                  backgroundColor: cornflowerBlue,
                  foregroundColor: Colors.white,
                  onTap: () {
                    print('Message Tapped');
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: white,
              selectedFontSize: 13.sp,
              unselectedFontSize: 13.sp,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 40.r), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long, size: 40.r), label: 'Order History'),
                BottomNavigationBarItem(
                    label: 'Pending Cart',
                    icon: Stack(
                      clipBehavior: Clip.none,
                        children: [
                          Icon(Icons.shopping_cart, size: 40.r),
                          if (cubit.cart > 0)
                            Positioned(
                              right: 30.w,
                              top: -12.h,
                              child: Container(
                                padding: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                  color: badgeColor,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 10.r,
                                  minHeight: 10.r,
                                ),
                                child: Center(
                                  child: cubit.cart > 9 ?
                                  Text(
                                    '9+',
                                    style: TextStyle(
                                      fontFamily: "Cairo",
                                      color: white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ) :
                                  Padding(
                                    padding: EdgeInsets.all(2.r),
                                    child: Text(cubit.cart.toString(),
                                      style:TextStyle(
                                        fontFamily: "Cairo",
                                        color: white,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,), textAlign: TextAlign.center,
                                    ),
                                  ),

                                ),
                              ),
                            ),
                        ],) ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 40.r), label: 'Account'),
              ],
            ),
          );
        },
    );
  }
}