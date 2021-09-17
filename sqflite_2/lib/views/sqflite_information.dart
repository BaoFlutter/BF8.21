import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_flutter/data_sources/information_database.dart';
import 'package:widget_flutter/models/information.dart';
import 'package:widget_flutter/resources/strings.dart';
class SQFliteInforamtion extends StatefulWidget {
  const SQFliteInforamtion({Key? key}) : super(key: key);

  @override
  _SQFliteInforamtionState createState() => _SQFliteInforamtionState();
}

class _SQFliteInforamtionState extends State<SQFliteInforamtion> {

  final db = InformationDatabase();

  Future<List<Information>>? informationList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInformation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SAVED_INFORMATION),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: FutureBuilder<List<Information>>(
          future: informationList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text(ERROR_DATA_LOAD),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<Information> infors = snapshot.data!;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: infors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Card(
                      child: Row(
                        children: [
                          Text(infors[index].user_name!),
                          const SizedBox(width:5),
                          Text(infors[index].age!.toString()),
                        ],
                      ),
                    )
                  );
                }
            );

          },
        ),


      ),
    );
  }

  fetchInformation(){
   informationList = db.fetchAll();
  }
}
