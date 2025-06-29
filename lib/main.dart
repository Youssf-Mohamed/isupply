import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isupply/screens/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:isupply/shared/constants.dart';

import 'bloc/cubit.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
      BlocProvider(
        create: (context) => AppCubit(),
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(500, 1200),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: cornflowerBlue,
              ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: paleCyan,
                strokeWidth: 5.r
              ),
              iconButtonTheme: IconButtonThemeData(
                  style: ButtonStyle(iconColor: WidgetStatePropertyAll(white),backgroundColor: WidgetStatePropertyAll(vividCerulean),),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: cornflowerBlue,
                unselectedIconTheme: IconThemeData(color: Colors.grey.shade500),
                selectedLabelStyle: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w900,
                  color: cornflowerBlue,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w900,
                ),
              ),
              scaffoldBackgroundColor: white,
              switchTheme: SwitchThemeData(
                thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return vividCerulean; // ON state
                  }
                  return paleCyan; // OFF state
                }),
                trackColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return paleCyan; // ON state
                  }
                  return cornflowerBlue; // OFF state
                }),
              ),
              sliderTheme: SliderThemeData(
                trackHeight: 4.r,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.lightBlueAccent,
                overlayColor: Colors.lightBlueAccent.withOpacity(0.2),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.r),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
              ),
              searchBarTheme: SearchBarThemeData(
                backgroundColor: WidgetStatePropertyAll(white),
                textStyle: WidgetStatePropertyAll(TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp
                )),
              ),
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: cornflowerBlue,
                selectionColor: vividCerulean.withOpacity(0.4),
                selectionHandleColor: cornflowerBlue,
              ),
              iconTheme: IconThemeData(
              color: cornflowerBlue
          ),
              textTheme: TextTheme(
              titleMedium: TextStyle(
                fontFamily: "Cairo",
              ),
            )
          ),
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        );
      },
    );
  }
}

