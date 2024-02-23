import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:flutter_assigment_bank_mas/data/models/landing_page_model/landing_page_model.dart';
import 'package:flutter_assigment_bank_mas/data/repository/landing_page_repository.dart';
import 'package:meta/meta.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  final LandingPageRepository landingPageRepository;
  LandingPageBloc({required this.landingPageRepository}) : super(const LandingPageState()) {
    on<FetchDataEvent>(fetchData);
  }

  Future<void> fetchData(
      FetchDataEvent event, Emitter<LandingPageState> emit) async {
    emit(state.copyWith(submitStatus: FormzSubmissionStatus.inProgress));
      try {
        final result = await landingPageRepository.getData();
        await result.when(success: (response) async {
          LandingPageModel landingPageModel = response.data;
          Datum gridView = Datum();
          Datum listView = Datum();
          if((landingPageModel.data??[]).isNotEmpty) {
            landingPageModel.data?.forEach((element) {
              if ((element.section ?? '').contains("articles")) {
                listView = element;
              } else {
                gridView = element;
              }
            });
          }
          emit(state.copyWith(
            landingPageModel: landingPageModel ,
              gridView: gridView,
              listView: listView,
              submitStatus: FormzSubmissionStatus.success));
        }, failure: (error) {
          emit(state.copyWith(
              landingPageModel: null ,
              gridView: null,
              listView: null,
            failureMessage: error,
              submitStatus: FormzSubmissionStatus.failure));
        });
      } catch (error) {
        emit(state.copyWith(
            submitStatus: FormzSubmissionStatus.failure));
        if (kDebugMode) {
          print(error);
        }
      }
  }
}
