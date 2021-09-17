import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_flutter/controllers/information_controller.dart';
import 'package:widget_flutter/data_sources/information_database.dart';
import 'package:widget_flutter/models/information.dart';
import 'package:widget_flutter/resources/strings.dart';
import 'package:widget_flutter/resources/widgets/box.dart';
import 'package:widget_flutter/resources/widgets/common_widget.dart';
import 'package:widget_flutter/resources/widgets/information_widget.dart';
import 'package:widget_flutter/resources/widgets/text_input_widget.dart';
import 'package:widget_flutter/views/information_screen.dart';
import 'package:widget_flutter/views/saved_information.dart';
import 'package:widget_flutter/views/sqflite_information.dart';
import 'package:widget_flutter/views/state_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
// 1. Tạo ra State , 2. Gán State - Context , context đại diện cho 1 widget
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? usernameController, birthYearController;
  String userName = NOT_DEFINE;
  String age = NOT_DEFINE;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final db = InformationDatabase();

  saveInformation(Information infor) async
  {
    await db.addInfor(infor);
  }



// 3 . khởi tạo state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    birthYearController = TextEditingController();
   // 1. khởi tạo state
    // 2. được dùng để đặt các lệnh thực thi trước khi build : load dữ liệu từ cơ sở dữ liệu
    // 3. context không hoạt động
  }

  // 4. Chạy khi load Dependency và khi Dependency thay đổi , lúc này Widget có context
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  // 6. Gọi khi Widget configuration thay đổi
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  //8 . Xoá State khỏi Tree , xảy ra khi huỷ widget đó
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  // 9. huỷ state đi
  @override
  void dispose() {
    // TODO: implement dispose
    print("Hàm dispose được chaỵ, state bị xoá");
    if(!mounted) { print ("Biến mounted là false "); }

    super.dispose();
    usernameController!.dispose();
    birthYearController!.dispose();
  }

// 5. Hàm build
  @override
  Widget build(BuildContext context) {
    // 2. mounted = true ;

    print("Hàm build được chạy ") ;

    return Scaffold(

      appBar: AppBar(
        title: Text(USER_INFORMATION),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Tên Widget
              TextInputWidget(
                  labelText: USER_NAME,
                  hintText: USER_NAME_HERE,
                  controller: usernameController!),
              // Năm sinh Widget
              TextInputWidget(
                  labelText: BIRTH_YEAR,
                  hintText: BIRTH_YEAR_HERE,
                  controller: birthYearController!),
              // Xac nhan Buttons
              ElevatedButton(onPressed: (){
                // 7. Hàm setState : Build lại toàn bộ các Widget , kể cả các widget không liên quan
                  userName = usernameController!.text;
                  age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();

                Get.put(InformationController()).updateInformation(userName: userName, age: age);

                Information  infor = Information(id: null, user_name: userName, age: int.parse(age));

                saveInformation(infor) ;

                //storeInformation(userName: userName, age: age);

              }, child: Text(CONFIRM)),
              /*
              confirmationButton(
                  onPressed: (){
                   setState(() {
                     userName = usernameController!.text;
                     age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                   });
                  },
                  lableButton: "Xác nhận"),

               */
              // Information Widget
             const Box(),
              InformationWidget(
                  userNameContent: Get.put(InformationController()).userName,
                  ageContent: Get.put(InformationController()).age),
              // Next Page Button Widget
              TextButton(onPressed: (){
                /*
                var route = MaterialPageRoute(builder: (context) => InformationScreen(
                    userName: userName, age: age));
                Navigator.push(context, route);

                 */
                var route = MaterialPageRoute(builder: (context) => StateWidget(
                    userName: userName, age: age));
                Navigator.push(context, route);

              },
                  child: Text(NEXT_PAGE)),
              TextButton(onPressed: (){

                Get.to(SQFliteInforamtion());

              },
                  child: Text(VIEW_SAVED_INFORMATION)),
            ],
          ) ,
        ),
      )
    );
  }


  // lưu thông tin vào sharedpreference ( key: value ) ; int , double , String , bool
 storeInformation({ required String userName, required String age}) async {
  final SharedPreferences prefs = await _prefs;
  await prefs.setString("information", USER_NAME + ":" + userName + "\n" + AGE + ":" + age );
  print ("Saved Information") ;
}






}
