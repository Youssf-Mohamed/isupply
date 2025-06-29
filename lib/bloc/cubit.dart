import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isupply/bloc/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<String>categoryTitles=[
    "Best Price",
    "Cosmetics",
    "Sellers",
    "Manufacturers",
    "Shortage Items",
  ];
  List<String>categorySubtitle=[
    "List of 10,000 items",
    "List of 10,000 items",
    "List of 20 preferred Stores",
    "List of 20 preferred Manufacturers ",
    "List of out of  stock items",
  ];
  List<String>categoryIcons=[
    "assets/category_icons/Discount.png",
    "assets/category_icons/Shampoo.png",
    "assets/category_icons/Shop.png",
    "assets/category_icons/Factory.png",
    "assets/category_icons/Empty Box.png",
  ];
  List<String> invoice=[
    "Best Invoice",
    "Cover your stock gaps quickly and affordably",
  ];
  String invoiceImage="assets/invoice_background.png";
  double remaining=100000.0;
  double spent =0;
  int remainingDays=30;
  int notifications =10;
  int cart=2;
  bool creditMode=true;
  double sliderValue=0;
  bool is14DayCycle=true;
  int creditState=0;
  List<Map<String,dynamic>> items=[
    {
      "name":"PANADOL ADVANCE 24 TAB",
      "pPrice":37.87,
      "cPrice":57.00,
      "discount":33.56,
      "from":"Target Pharma",
      "image":"assets/item.png",
      "offer":false,
      "trusted":true,
      "count":0,
    },
    {
      "name":"PANADOL ADVANCE 24 TAB",
      "pPrice":37.87,
      "cPrice":57.00,
      "discount":33.56,
      "from":"Target Pharma",
      "image":"assets/item.png",
      "offer":true,
      "trusted":false,
      "count":0,
    },
    {
      "name":"PANADOL ADVANCE 24 TAB",
      "pPrice":37.87,
      "cPrice":57.00,
      "discount":33.56,
      "from":"Target Pharma",
      "offer":true,
      "trusted":false,
      "count":0,
    }
  ];
  String percentage(){
    double limit=remaining+spent;
    return ((remaining/limit)*100).toStringAsFixed(0);
  }
  void changeCreditMode(){
    creditMode=!creditMode;
    emit(ChangeCreditModeState());
  }
  void changeSliderValue(value){
    sliderValue=value;
    emit(ChangeSliderValueState());
  }
  void changeDayCycle(value){
    is14DayCycle=value;
    emit(ChangeDayCycleState());
  }
  void creditApply(){
    emit(WaitState());
    Future.delayed(Duration(seconds: 3), () {
      creditState=1;
      emit(CreditApplySuccessfulState());
      Future.delayed(Duration(seconds: 3), () {
        emit(WaitState());
        Future.delayed(Duration(seconds: 3), () {
          creditState=2;
          emit(CreditApplySuccessfulState());
        });
      });
    });
  }
  void addAndRemoveItems(index,isAdd){
    if(isAdd)
      {
        items[index]["count"]++;
      }
    else{
      if(items[index]["count"]>0)
        {
          items[index]["count"]--;
        }
    }
    emit(AddOrRemoveItemState());
  }
}

