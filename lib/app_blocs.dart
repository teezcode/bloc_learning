import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/app_events.dart';
import 'package:ulearning_bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
  AppBlocs() : super(InitState()){
    on<Increment>((event, emit){
      emit(AppStates(counter:state.counter + 1));
    });

    on<Decrement>((event, emit){
      emit(AppStates(counter:state.counter - 1));
    });
  }
}