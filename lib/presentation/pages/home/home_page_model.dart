import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_state.dart';

class HomePageModel extends Cubit<HomePageState> {
  HomePageModel() : super(HomePageStateInitial());
}
