import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_ex/main.dart';
class ReduxScreen extends StatelessWidget {
  final Store<int>? store;
  const ReduxScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: store!,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Redux Demo"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Giá trị số nguyên trên Store"),
                const SizedBox(
                  height: 10,
                ),
                StoreConnector<int, String>(
                  converter: (store)=>store.state.toString(),
                    builder: (context, number){
                    return Text(
                      number,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                    }
                    ),
              ],
            ),

          ),
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store){
              return ()=> store.dispatch(ReduxActions.Increment);
            },
            builder: (context, callback){
              return FloatingActionButton(
                  onPressed: callback,
                child: Icon(Icons.add),
              );
            }
          ),
        )

    );
  }
}
