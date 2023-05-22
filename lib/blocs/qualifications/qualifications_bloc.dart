import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_template/models/qualifications.dart';
import 'package:final_template/repositories/qualifications_repository.dart';

part 'qualifications_event.dart';
part 'qualifications_state.dart';

class QualificationsBloc
    extends Bloc<QualificationsEvent, QualificationsState> {
  final QualificationsRepository qualificationsRepository;

  Stream<List<Qualifications>> getQualifications() {
    return qualificationsRepository.readQualifications();
  }

  QualificationsBloc({required this.qualificationsRepository})
      : super(QualificationsState.unknown()) {
    on<ReadQualificationsEvent>((event, emit) async {
      emit(state.copyWith(qualificationsStatus: QualificationsStatus.loaded));
    });

    on<CreateQualEvent>((event, emit) async {
      await qualificationsRepository.createQualifications(
          event.id, event.name, event.college, event.university);
    });
  }
}
