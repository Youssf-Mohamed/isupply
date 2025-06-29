import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isupply/bloc/cubit.dart';
import 'package:isupply/bloc/states.dart';
import 'package:isupply/screens/invoice_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared/components.dart';
import '../shared/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    double childAspectRatio = (1.sw / 2) / (1.sw / 4);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        var cubit=AppCubit.get(context);
        List<Widget> creditWidgets=[
          creditRequest(
            context: context,
            cubit: cubit,
            state: state
          ),
          creditRequestPending(
            cubit: cubit,
            context: context,
            state: state
          ),
          credit(
            percentage: cubit.percentage(),
            remaining: cubit.remaining,
            spent: cubit.spent,
            days: cubit.remainingDays,
            creditMode: cubit.creditMode,
            context: context,
            cubit: cubit,
          ),
        ];
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        children: [
                          creditWidgets[cubit.creditState],
                          rxCredit(number: 280.0,used: 0.0,creditMode: cubit.creditMode,cubit: cubit,context: context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                          activeDotColor: cornflowerBlue,
                          dotColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Divider(
                  height: 1.h,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(height: 10.h,),
              SizedBox(
                  height: 100.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    child: invoice(title: cubit.invoice[0],subtitle: cubit.invoice[1],backgroundImage: cubit.invoiceImage,context: context,onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceScreen(),));
                    }),
                  ),
                ),
              GridView.builder(
                padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 20.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 30.h,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => category(
                  title: cubit.categoryTitles[index],
                  subtitle: cubit.categorySubtitle[index],
                  icon: cubit.categoryIcons[index],
                  item:index,
                  context: context,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}