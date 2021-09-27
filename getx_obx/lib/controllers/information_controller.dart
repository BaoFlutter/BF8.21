import 'package:get/get.dart';

// Obx  : Observer + RxDart
// RxString rxString => String : rxString.value;
//String  string => RxString ; string.obs ;

class InformationController extends GetxController{
  var userName = " ".obs;
  var  age = " ".obs ;

  updateInformation({required String userName, required String age}){
    this.userName = userName.obs;
    this.age = age.obs;
  }

}