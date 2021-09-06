import 'package:flutter/material.dart';
import 'package:widget_flutter/views/information_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? usernameController, birthYearController;
  String userName = "Chưa xác định";
  String age = "Chưa xác định";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    birthYearController = TextEditingController();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController!.dispose();
    birthYearController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Thông tin người dùng"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Tên Widget
              textInputWidget(
                  labelText: "Họ và Tên",
                  hintText: "Nhập họ và tên ở đây",
                  controller: usernameController),
              // Năm sinh Widget
              textInputWidget(
                  labelText: "Năm sinh",
                  hintText: "Nhập năm sinh",
                  controller: birthYearController),
              // Xac nhan Buttons
              ElevatedButton(onPressed: (){
                setState(() {
                  userName = usernameController!.text;
                  age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                });

              }, child: Text("Xác nhận")),
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
              informationWidget(
                  userNameContent: userName,
                  ageContent: age),
              // Next Page Button Widget
              TextButton(onPressed: (){
                var route = MaterialPageRoute(builder: (context) => InformationScreen(
                    userName: userName, age: age));
                Navigator.push(context, route);

              },
                  child: Text("Next Page")),
            ],
          ) ,
        ),
      )
    );
  }

  Widget textInputWidget({required String labelText, required String hintText, required controller }){
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText
        ),
        controller: controller,
      )
    );

  }

  Widget confirmationButton({required onPressed, required String lableButton }){
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(lableButton));
  }
  Widget informationWidget({ required String userNameContent, required String ageContent })
  {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Thông tin"),
              SizedBox(height: 10,),
              textWidget(labelText: "Họ và tên: ", content: userNameContent),
              SizedBox(height: 10,),
              textWidget(labelText: "Tuổi: ", content: ageContent),

            ],
          ),
        ),
      ),
    );
  }

  textWidget({required String labelText, required String content}){
    return Container(
      child: Row(
        children: [
          Text(labelText, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(content)
        ],
      ),
    );
  }



}
