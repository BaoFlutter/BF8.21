import 'dart:async';

import 'package:bloc_event_state/blocs/timer_bloc/timer_event.dart';
import 'package:bloc_event_state/blocs/timer_bloc/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState>{
  static int _initDuration = 60;
  TimerBloc() : super(InitialState(_initDuration));

  StreamSubscription<int>? _timerSubcription;

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if(event is StartEvent){
      yield RunningState(event.duration);
      _timerSubcription?.cancel();
      _timerSubcription = tick(event.duration).listen((duration) => add(RunEvent(duration)));
    } else if(event is RunEvent){
      yield event.duration > 0 ? RunningState(event.duration) : CompletedState();
    }
    else if(event is PauseEvent)
    {
      if(state is RunningState)
      {
        _timerSubcription?.pause();
        yield PauseState(state.duration) ;
      }

    }
    else if(event is ResumeEvent){
      if(state is PauseState){
        _timerSubcription?.resume();
        yield RunningState(state.duration);
      }
    }
    else if (event is ResetEvent)
    {
      _timerSubcription?.cancel();
      yield InitialState(_initDuration) ;
    }

  }


  @override
  Future<void> close() {
    // TODO: implement close
    _timerSubcription?.cancel();
    return super.close();
  }



  Stream<int> tick(int ticks) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }

}