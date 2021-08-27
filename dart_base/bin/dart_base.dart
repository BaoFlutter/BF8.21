import 'package:dart_base/dart_base.dart' as dart_base;

int num = 10; 
void main(List<String> arguments) {
  //print('Hello world: ${dart_base.calculate()}!');
  String userName = "Báo Flutter" ;
  bool isLoginedRecently = true; 

  const String API_KEY = "nskhfgksnge" ;
  final int AGE = 30 ; 
  // int 5, 6, 800, 100, double : 6.7, 9..77, bool ( true, false), String: ("hello") ; 
  int number = 20; 
  //print("Giá trị của number: " + number.toString());
  //print("Giá trị của number: $number" );

  number = AGE + 10; // 40

  double point = 8.5; 

  print("Giá trị của number: $number" );
  bool isSignedUp = false; 

  if(isSignedUp) print("Đã đăng kí") ;
  else print(" $userName  chưa đăng kí") ;

  // Null Safety 
  // Dart SDK : < 2.12  : Chưa sửa dụng Null Safety 
  //int birthYear ; // null ; birthYear = null vs version < 2.12

  // DartSDK >= 2.12 : Đã sử dụng NullSafety 
  int? birthYear ; // null ;
  //number = birthYear! + 5; 
  print("$birthYear");

  int tong = tinhTong(number , number);
  print("tông: $tong");

  printMessage();
 
  // dynamic : var, dynamic 
  var random1 = 5; 
  //random1 = false; // error 
  var random2 = "Hello" ; // true, 8.5 , 

  dynamic dynamicVariable = 6; 
  dynamicVariable = "xin Chao" ;

  List<int> numberList = [6, 8, 9];
  // index :  0, 1, 2 
  // length ;  3
  //inRaSoChan(numberList);
  //inRaSoChan(numberList: numberList);
  inRaSoChan(numberList: numberList);

  List<dynamic> dymamicList = [true, 1, "hello", 9.6];
  
  List dymamicList2 = [true, 1, "hello", 9.6];

  Map<int, String> map = {};

  // toán tử gán 
  number += 2; // number = number + 2 ; 
  // number %= 2; number = number % 2; 
  print("Giá trị của number: $number") ;
  // toán tử so sánh hoặc, và
  // && <=> *  : true = 1; false = 0 ; true && false = 0; true && true = 1; 
  // || <=> + ; true = 1; false = 0;  true || true = true ; false || false = false ; false || true = true;

  int otherNumber = 39; 
  if( (otherNumber!=number)&& (number > otherNumber)) print("$number lớn hơn $otherNumber");
  // true&&false : false
  //
  if( (otherNumber == number)|| (number < otherNumber)) print("$number bằng $otherNumber"); 

  if(otherNumber != number ) {
    print("Hai số $number và $otherNumber khác nhau") ;
  }
  if(otherNumber < number ) {
    print("Hai số $number lớn $otherNumber ") ;
  }

  //if(isEvenNumber(number: number)) print("Số $number là số chẵn") ;

  if(isEvenNumberUsingSwitchCase(number: number)) print("Số $number là số chẵn") ;

  // for 
  inRaSoLe(numberList: numberList) ;

  // while 
  inRaSoChanWithWhile(numberList: numberList) ;

  // do _ while
  inRaSoChanWithDoWhile(numberList: numberList) ;
  // list 
  List<double> pointList = []; 
  List<double> pointList1 = [5.6, 7.8, 9.3];

  //  pointList1[2] = 9.3;

  pointList1.add(4.6);
  print(pointList1.toString()) ;

  // Map là một tập hợp của rất nhiều cặp:  key : value

  Map<String, String> inforMap = {
    "name" : "Báo Flutter",
    "age" : "30"

  } ;

  print("Tên: " + inforMap["name"].toString()) ;

  Map<String, dynamic> inforMap1 = {
    "name" : "Báo Flutter",
    "age" : 30

  } ;

  print("Tuổi: " + inforMap1["age" ].toString()) ;

  Map<dynamic, dynamic> inforMap2 = {
    "name" : "Báo Flutter",
    3 : "hello"
  } ;

  print("Xin chào: " + inforMap2[3].toString()) ;

  Map inforMap3 = {
    "name" : "Báo Flutter",
    3 : "hello"

  } ;






 }

 bool isEvenNumberUsingSwitchCase({required int number }){

   int modNumber = number%2; 

   switch(modNumber){
     case 0:
     return true;
     
     case 1: 
     return false;

     default:
     return false; 
   }

   print("Kêt thuc") ;

   return false; 

 }

 void inRaSoChan({ required List<int>? numberList }) 
 {
   // 6, 8, 9
   for(int number in numberList!)
   {
   if(number%2 == 0) print("Số chẵn: $number") ;
   }

 }

 void inRaSoChanWithWhile({ required List<int>? numberList }) 
 {
   // 6, 8, 9
   int i = 0;
   while(i< numberList!.length)
     {
       if(numberList[i] %2 == 0) print("Số chẵn: " + numberList[i].toString()) ;
       i++;
     }

     print("Vong While kết thúc") ;
   
 }

 void inRaSoChanWithDoWhile({ required List<int>? numberList }) 
 {
   // 6, 8, 9
   int i = 0;
   
     do{
       if(numberList![i] %2 == 0) print("Số chẵn: " + numberList[i].toString()) ;
       i++;
     }
     while(i< numberList.length);

     print("Vong Do While kết thúc") ;
   
 }

 void inRaSoLe({ required List<int>? numberList }) 
 {
   // for in 
   /*
   for(int number in numberList!)
   {
   if(number%2 == 0) print("Số chẵn: $number") ;
   }
   */
   for(int i = 0 ; i <= numberList!.length - 1; i++)
   {
     // i ++ ; <=> i = i+ 1
     if(numberList[i] %2 != 0) print("Số lẻ: "+ numberList[i].toString()) ;
    // break;
    //return ; 
    print ("Vong " + (i+1).toString()) ;
    continue; 
    print("Vong tiep theo") ;

   }

   print("Vong For kết thúc") ; 

 }





 bool isEvenNumber({required int number})
 {
   if(number%2 == 0) return true;
   return false; 
 }

 int tinhTong( int a , int b){
    return a + b ; 
 }

 dynamic tinhHieu1( var a , var b){
    return a - b ; 
 }

 tinhHieu2( a , b){
    return a - b ; 
 }

 void printMessage(){
   print("Xin chao");
   return; 

 }

 
