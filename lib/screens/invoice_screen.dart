import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isupply/bloc/cubit.dart';
import 'package:isupply/bloc/states.dart';

import '../shared/components.dart';
import '../shared/constants.dart';

class InvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(context, state) {

        } ,
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              leading: SizedBox(),
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
                      Container(
                        width: 50.r,
                        height: 50.r,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.document_scanner_rounded,
                            color: white,
                          ),
                          iconSize: 25.r, // The icon itself is 30.r
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(EdgeInsets.all(0)),
                          ),
                        ),
                      ),
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
              body: ListView.builder(
                itemCount: cubit.items.length,
                itemBuilder: (context, index) {
                  return invoiceItem(
                    context: context,
                    name: cubit.items[index]['name'],
                    from: cubit.items[index]['from'],
                    pPrice:cubit.items[index]['pPrice'],
                    cPrice: cubit.items[index]['cPrice'],
                    discount: cubit.items[index]['discount'],
                    count: cubit.items[index]['count'],
                    image: cubit.items[index]['image'],
                    offer: cubit.items[index]['offer'],
                    trusted:cubit.items[index]['trusted'],
                    cubit: cubit,
                    index:index,
                  );
                }
              )
          );
        },
    );
  }
}
