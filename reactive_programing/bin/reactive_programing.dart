import 'package:reactive_programing/reactive_programing.dart' as reactive_programing;
import 'package:rxdart/rxdart.dart';


void main(List<String> arguments) {

  //demoBehaviourSubject();
  //demoPublishSubject();
  demoReplaySubject();
  
}

demoBehaviourSubject(){

  /*
  PublishSubject chỉ lấy các giá trị thêm vào sau này 
  */
  BehaviorSubject behaviorSubject = BehaviorSubject<int>();
 
  // Lấy dữ liệu lần 1 
  behaviorSubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });

  behaviorSubject.add(100);
  behaviorSubject.add(101);

  // Lấy dữ liệu lần 2
  behaviorSubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });

  behaviorSubject.add(200);
  behaviorSubject.add(201);

}

demoPublishSubject(){

  /*
  BehaviorSubject sẽ lấy hết giá trị thêm vào sau lệnh lấy dữ liệu và giá trị được thêm vào gần nhất
  lệnh lấy giá trị trong Stream đó 
  */
  PublishSubject publishSubject = PublishSubject<int>();
 
  // Lấy dữ liệu lần 1 
  publishSubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });

  publishSubject.add(100);
  publishSubject.add(101);

  // Lấy dữ liệu lần 2
  publishSubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });

  publishSubject.add(200);
  publishSubject.add(201);

}

demoReplaySubject(){

  /*
  ReplaySubject sẽ lấy hết giá trị trong Stream dù add trước hay add sau
  */
  ReplaySubject replaySubject = ReplaySubject<int>();
 
  // Lấy dữ liệu lần 1 
  replaySubject.listen((value){
    print("Lấy dữ liệu lần 1: $value");
  });

  replaySubject.add(100);
  replaySubject.add(101);

  // Lấy dữ liệu lần 2
  replaySubject.listen((value){
    print("Lấy dữ liệu lần 2: $value");
  });

  replaySubject.add(200);
  replaySubject.add(201);

}

