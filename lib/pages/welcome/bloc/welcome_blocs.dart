import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState>{
  WelcomeBloc() : super(WelcomeState()){
    on<WelcomeEvents>((event, emit){
      emit(WelcomeState(page: state.page));
    });
  }
}