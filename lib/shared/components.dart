import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../bloc/states.dart';
import 'constants.dart';

Widget category({required title,required subtitle,icon=Icons.percent,context,item}) => InkWell(
  onTap: () => print(item),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1.r,
              blurRadius: 2.r,
              offset: Offset(0.w, 2.h),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.r,),
              Text(
                '$title',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: cornflowerBlue,fontSize: 25.r,fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20.h),
              Text(
                '$subtitle',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontSize: 15.r,fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: -20.h,
        right: -10.w,
        child: Container(
          width: 70.w,
          height: 85.h,
          decoration: BoxDecoration(
            color: vividCerulean,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1.r,
                blurRadius: 2.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Image(image: AssetImage(icon)),
            ),
          ),
        ),
      ),
    ],
  ),
);

Widget invoice({required title,required subtitle,required backgroundImage,context,onTap}) => InkWell(
  onTap: onTap,
  child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          color: cornflowerBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1.r,
              blurRadius: 2.r,
              offset: Offset(-1.w, 2.h),
            )
          ],
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(3.r),
              child: Stack(
                children: [
                  Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image(image: AssetImage(backgroundImage),fit: BoxFit.cover),
                ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:10.r,horizontal: 20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$title',
                           style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 5.h,),
                        Text(
                          '$subtitle',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(3.r),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: paleCyan,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                        topRight: Radius.circular(12.r))),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 30.r,
                  color: cornflowerBlue,
                ),
              ),
            ),
          ),
        ],
      )
    ],
  ),
);

Widget credit({required percentage,required remaining,required spent,required days,context,required creditMode,cubit}) => Padding(
  padding: EdgeInsets.only(
      top: 15.h, right: 15.w, left: 15.w, bottom: 30.h),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: BoxDecoration(
                color: cornflowerBlue,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1.r,
                    blurRadius: 2.r,
                    offset: Offset(0.w, 2.h),
                  ),
                ]
            ),
          ),
          Blur(
            blur: !creditMode?2.5:0,
            blurColor: paleCyan,
            overlay: !creditMode?Text('Cash Mode',maxLines: 1,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 25.sp,fontWeight: FontWeight.w900),):null,
            colorOpacity: !creditMode?0.5:0,
            borderRadius: BorderRadius.circular(15.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: vividCerulean,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Text(
                            'Credit Limit 100,000.00  30 days',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Remaining : ',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),),
                                  TextSpan(
                                    text: '${remaining}',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 25.r,fontWeight: FontWeight.w900),),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'spent : ',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),),
                                  TextSpan(
                                    text: '$spent',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w900),),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Remaining days',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),),
                            Text(
                              '$days days (${DateTime.now().add(Duration(days: days)).year}-${DateTime.now().add(Duration(days: days)).month}-${DateTime.now().add(Duration(days: days)).day})',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Text(
                          'Last Update 03:53 PM',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey.shade300,fontSize: 15.r,fontWeight: FontWeight.w100),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CircularPercentIndicator(
                      radius: 70.r,
                      progressColor: vividCerulean,
                      backgroundColor: paleCyan,
                      lineWidth:10.w,
                      percent: (double.parse(percentage)/100),
                      reverse: true,
                      center: Text(
                        "$percentage / 100",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 12.sp,fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: -20.h,
            right: -10.w,
            child: InkWell(
              onTap: () {
                print("Manage");
              },
              child: Blur(
                blur: !creditMode?2.5:0,
                blurColor: paleCyan,
                colorOpacity: !creditMode?0.5:0,
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: paleCyan,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1.r,
                        blurRadius: 2.r,
                        offset: Offset(0.w, 2.h),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Manage',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(creditMode?"Credit Mode":"Cash Mode", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 12.sp,fontWeight: FontWeight.w700),),
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: creditMode,
                onChanged: (value) {
                  cubit.changeCreditMode();
                },
              ),
            ),
          )
        ],
      ),
    ],
  ),
);

Widget creditRequest({context,cubit,state}) => Padding(
  padding: EdgeInsets.only(
      top: 15.h, right: 15.w, left: 15.w, bottom: 30.h),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: BoxDecoration(
                color: cornflowerBlue,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1.r,
                    blurRadius: 2.r,
                    offset: Offset(0.w, 2.h),
                  ),
                ]
            ),
          ),
          ConditionalBuilder(
              condition: state is WaitState,
              builder: (context) => Center(child: CircularProgressIndicator()),
              fallback: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: vividCerulean,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Text(
                              'Credit Request up to 100,000.00 ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Slider(
                                min: 0,
                                max: 100000,
                                value: cubit.sliderValue,
                                divisions: 1000,
                                onChanged: (value) {
                                  cubit.changeSliderValue(value.ceil().toDouble());
                                },
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Current Selection : ',
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),),
                                    TextSpan(
                                      text: '${cubit.sliderValue}',
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 25.r,fontWeight: FontWeight.w900),),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w),
                          child: Text(
                            'Choose Plan Duration ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.changeDayCycle(true);
                                },
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  topLeft: Radius.circular(20.r),
                                ),
                                child: Container(
                                  width: 100.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: cubit.is14DayCycle?vividCerulean:paleCyan,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      topLeft: Radius.circular(20.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1.r,
                                        blurRadius: 2.r,
                                        offset: Offset(0.w, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '14 Day Cycle',
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              ) ,
                              SizedBox(width: 5.w,),
                              InkWell(
                                onTap: () {
                                  cubit.changeDayCycle(false);
                                },
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  topLeft: Radius.circular(20.r),
                                ),
                                child: Container(
                                  width: 100.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: cubit.is14DayCycle?paleCyan:vividCerulean,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1.r,
                                        blurRadius: 2.r,
                                        offset: Offset(0.w, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '30 Day Cycle',
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              ) ,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
          Positioned(
            bottom: -20.h,
            right: -10.w,
            child: InkWell(
              onTap: () {
                print('Apply');
                cubit.creditApply();
              },
              child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: paleCyan,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1.r,
                        blurRadius: 2.r,
                        offset: Offset(0.w, 2.h),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Apply for Credit',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 18.r,fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
    ],
  ),
);

Widget creditRequestPending({context,cubit,state}) => Padding(
  padding: EdgeInsets.only(
      top: 15.h, right: 15.w, left: 15.w, bottom: 30.h),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
            color: cornflowerBlue,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1.r,
                blurRadius: 2.r,
                offset: Offset(0.w, 2.h),
              ),
            ]
        ),
      ),
      ConditionalBuilder(
          condition: state is WaitState,
          builder: (context) => Center(child: CircularProgressIndicator()),
          fallback: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: vividCerulean,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Text(
                          'Credit Request up to 100,000.00 ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your credit request is under review ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: vividCerulean,
                                        child: Text('1',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),),
                                      ),
                                      Expanded(child: Container(height: 2.h,color: vividCerulean,)),
                                      CircleAvatar(
                                        backgroundColor: vividCerulean,
                                        child: Text('2',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),),
                                      ),
                                      Expanded(child: Container(height: 2.h,color: vividCerulean,)),
                                      CircleAvatar(
                                        backgroundColor: paleCyan,
                                        child: Text('3',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),),
                                      ),
                                      Expanded(child: Container(height: 2.h,color: paleCyan,)),
                                      CircleAvatar(
                                        backgroundColor: paleCyan,
                                        child: Text('4',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 100.w,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Received',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),),
                                      Expanded(child: Container()),
                                      Text('Validating',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),),
                                      Expanded(child: Container()),
                                      Text('Processing',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),),
                                      Expanded(child: Container()),
                                      Text('Finalizing',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),),
                                    ],
                                  ),
                                )
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Estimated Review Time: ',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w100),),
                                  TextSpan(
                                    text: '5 Days',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 15.r,fontWeight: FontWeight.w700),),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
      )
    ],
  ),
);


Widget rxCredit({required number,required used,context,required creditMode,cubit}) => Padding(
  padding: EdgeInsets.only(
      top: 15.h, right: 15.w, left: 15.w, bottom: 30.h),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: BoxDecoration(
                color: cornflowerBlue,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1.r,
                    blurRadius: 2.r,
                    offset: Offset(0.w, 2.h),
                  ),
                ]
            ),
          ),
          Blur(
            blur: !creditMode?2.5:0,
            blurColor: paleCyan,
            overlay: !creditMode?Text('Cash Mode',maxLines: 1,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 25.sp,fontWeight: FontWeight.w900),):null,
            colorOpacity: !creditMode?0.5:0,
            borderRadius: BorderRadius.circular(15.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Text(
                          'RX Wallet',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:10.h,),
                        child: Text(
                          '$number',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 30.r,fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Container(
                          width: double.infinity,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: paleCyan,
                            borderRadius: BorderRadius.circular(10.r)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:10.h,),
                        child: Text(
                          'Used amount: $used',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 20.r,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(creditMode?"Credit Mode":"Cash Mode", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: white,fontSize: 12.sp,fontWeight: FontWeight.w700),),
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: creditMode,
                onChanged: (value) {
                  cubit.changeCreditMode();
                },
              ),
            ),
          )
        ],
      ),
    ],
  ),
);

Widget invoiceItem({required name,required from,pPrice,cPrice,discount,count,image,offer,required index,required trusted,required context,cubit})=>  Padding(
  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
  child: Container(
    width: double.infinity,
    height: 230.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      color: Colors.grey.shade100,
    ),
    child: Column(
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14)),
            color: cornflowerBlue,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "$name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    trusted?CircleAvatar(
                      backgroundColor: white,
                      radius: 20.r,
                      child: Icon(Icons.handshake, color: cornflowerBlue),
                    ):Container(),
                    SizedBox(width: 10.w,),
                    Text(
                      "${(discount).toString()}%",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: white,
                          fontSize: 25.r,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pharmacy : ${pPrice} EGP",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: vividCerulean,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Consumer Price : ${cPrice} EGP",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: cornflowerBlue,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "From : Target Pharma",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: cornflowerBlue,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    cubit.addAndRemoveItems(index,false);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: vividCerulean,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft:  Radius.circular(14)),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.remove,color: white,),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$count",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    cubit.addAndRemoveItems(index,true);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: vividCerulean,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(14),bottomRight:  Radius.circular(14)),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add,color: white,),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: image!=null?Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: paleCyan,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14)),
                        ),
                        child: Center(
                          child: Image.asset("assets/item.png"),
                        ),
                      ):Container(),
                      flex: 3,
                    ),
                    offer?Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {

                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: vividCerulean,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomRight:  Radius.circular(14)),
                          ),
                          child: Center(
                            child: Text(
                              "View Offer",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                  color: white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ):Container(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  ),
);