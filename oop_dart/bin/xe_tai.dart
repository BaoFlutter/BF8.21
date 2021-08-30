import 'dart:io';

import 'xe.dart';

class XeTai extends Xe {

  XeTai({String? xeTaiBrand, int? xeTaiYear}): super(brand: xeTaiBrand, productYear: xeTaiYear );

  void printAge(){
    int age = DateTime.now().year - super.productYear!;
    super.chuyenCho();
    print("Tuổi của xe tải: " + age.toString());
  }

  @override
  chuyenCho() {
    // TODO: implement chuyenCho
    print("Xe này chở đá") ;
   
  }






}