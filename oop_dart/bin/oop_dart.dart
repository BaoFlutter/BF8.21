import 'dart:io';

import 'package:oop_dart/oop_dart.dart' as oop_dart;
import 'hinh_vuong.dart';
import 'user_information.dart';
import 'xe.dart';
import 'xe_tai.dart';

void main(List<String> arguments) {
  
  UserInformation bao = UserInformation(userName: "Báo", birthYear:  1991, address: "Ha Noi"); // Khởi Tạo 1 đối tượng; user : gọi là 1 đối tượng , hay gọi là 1 instance
  bao.setPhoneNumber(phoneNumber: "0454385935") ;

  print(bao.userName.toString() + " có số điện thoại là: " + bao.getPhoneNumber().toString());

  UserInformation an = UserInformation(userName: "Bao An", birthYear:  1996, address: "Ha Noi");

  List<UserInformation> userList = [];
  userList.add(bao);
  userList.add(an);

  int maxAge = 0 ; 
  UserInformation? maxAgeUser; 

  for(UserInformation user in userList){
    int age = user.getAge();
    if(age > maxAge) {
      maxAgeUser = user;
      maxAge = age;
    }
  }
  print("Người có tuổi cao nhất: " + maxAgeUser!.userName.toString() + maxAge.toString());


  an.birthYear = 1998;
  //an._phoneNumber = "0349582808" ;

  //print(an.userName);

  XeTai xeTai = XeTai(xeTaiBrand: "HuynDai", xeTaiYear: 1987);
  print(xeTai.brand);
  xeTai.printAge();

  xeTai.chuyenCho();

  
  // Class con sẽ sử dụng được các thuộc tính, phương thức public của cha.
  // Khi class cha được khởi tạo thì hàm khởi tạo của lớp con , cũng phải khởi tạo luôn lớp cha


HinhVuong hinhVuong = HinhVuong(canh: 5.0);
hinhVuong.tinhChuVi();
hinhVuong.tinhDienTich();
hinhVuong.getInfor();
  


}
