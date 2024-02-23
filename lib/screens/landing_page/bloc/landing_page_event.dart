part of 'landing_page_bloc.dart';

@immutable
abstract class LandingPageEvent {}

class FetchDataEvent extends LandingPageEvent {

  FetchDataEvent();
}
