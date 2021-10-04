import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_ex/views/redux_screen.dart';

enum ReduxActions { Increment }

int counterReducer(int state , action)
{
  if(action == ReduxActions.Increment)
    {
      return state+ 1;
    }
  return state;
}
Store<int>? store;
void main() {

  store = new Store<int>(counterReducer, initialState: 0 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReduxScreen(store: store)
    );
  }
}

