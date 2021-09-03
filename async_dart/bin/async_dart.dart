import 'package:async_dart/async_dart.dart' as async_dart;
import 'package:test/expect.dart';

void main(List<String> arguments) async {
  /*
  var number = makeLateNumber();
  // KQ : Instance of 'Future<int>'

  */
  /*
  var number = await makeLateNumber();

  //  int mumber =  await Future<T> ;
  // Future<T> number = Future<T>
  print(number.toString());
  */

/*
  // Dùng then
  makeLateNumber().then((number) {
    int sum = number + 5; 
    print("Dữ liệu lấy về là $number") ;
  });
  */
  print("Chương trình kết thúc") ;

  // Sử dụng Stream
  Stream<int> numberStream  = Stream<int>.periodic(
    Duration(seconds: 2),
    makeNumber
       );

      // printNumberFromStream(numberStream) ;

       //showNumberFromStream(numberStream) ;

       // tạo stream 
       Stream<int> otherNumberStream = countStream(10);

       showNumberFromStream(otherNumberStream) ;

  
}


// lập trình bất đồng bộ dùng cho task , mất 1 khoảng thời gian mới hoàn thành

Future<int> makeLateNumber(){

  return Future.delayed(
    Duration(seconds:2 ),
    (){return 5; }
    );

}

// Tạo Stream

int makeNumber(int value) => (value+1) ;

// lấy dữ liệu từ Stream dùng await - async 

printNumberFromStream(Stream<int> stream)async {
  await for (int number in stream)
  {
    print(number.toString());
  }

}
// lấy dữ liệu từ Stream sử dụng Listen 

showNumberFromStream(Stream<int> stream)
{
  stream.listen((number) { 
    print("Số lấy được từ stream:  $number");
  });

}

// tạo stream với yield , async* 

Stream<int> countStream (int max) async*{
  for(int i= 1; i<= max; i++)
  yield i;

}


