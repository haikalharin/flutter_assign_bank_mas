part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final LandingPageModel? landingPageModel;
  final Datum? gridView;
  final Datum? listView;
  final String? moveTo;
  final String? failureMessage;

  const LandingPageState({
    this.landingPageModel,
    this.moveTo,
    this.gridView,
    this.listView,
    this.failureMessage,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  LandingPageState copyWith({
    String? moveTo,
    String? failureMessage,
    Datum? gridView,
    Datum? listView,
    LandingPageModel? landingPageModel,
    FormzSubmissionStatus? submitStatus,
  }) {
    return LandingPageState(
      moveTo: moveTo ?? this.moveTo,
      failureMessage: failureMessage,
      landingPageModel: landingPageModel ?? this.landingPageModel,
      gridView: gridView ?? this.gridView,
      listView: listView ?? this.listView,
      submitStatus: submitStatus ?? FormzSubmissionStatus.initial,
    );
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object?> get props => [
        moveTo,
        failureMessage,
        landingPageModel,
        gridView,
        listView,
        submitStatus
      ];
}

class SideBarPageInitial extends LandingPageState {}
