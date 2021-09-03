
import 'dart:io';

import 'package:try_catch_dart/try_catch_dart.dart' as try_catch_dart;

void main(List<String> arguments) {
  var number = "hello" ;
  try {
  int convertedNumber = int.parse(number) ;

  }
  
  on FormatException{
    print("Đây là lỗi Format, xin hãy nhập dạng số") ;
  }
  catch(e)
  {
    print(e);
  }
  
 finally{
   print("Chạy lệnh trong khối Finally ") ;
 }

  print("Chương trình kết thúc");
  // 1 . Không làm chương trình dừng đột ngột
  // 2. Chỉ ra Exception đó là gì 
  kiemTraTuoi(10);
  try{
  kiemTraTuoi(0);
  //kiemTraTuoi(-8);
  }
  catch(e)
  {print(e);}

  try{
  kiemTraTuoi(-8);
  }
  catch(e)
  {print(e);}
  //kiemTraTuoi(-8);

  print("Kiểm tra tuổi kết thúc") ;

}

void kiemTraTuoi(int tuoi) {
if(tuoi<0) {
throw new Exception("Tuổi không được âm");
}
else if(tuoi==0){
  throw new Exception("Tuổi không được bằng 0");
}
else if (tuoi>60)
{
print ("Bạn đã già");
}
else print ("Bạn vẫn còn trẻ");
}
 
