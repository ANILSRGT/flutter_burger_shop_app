part of 'home_page_model.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageStateInitial extends HomePageState {}
