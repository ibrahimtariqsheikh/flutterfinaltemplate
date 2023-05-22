// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'qualifications_bloc.dart';

abstract class QualificationsEvent extends Equatable {
  const QualificationsEvent();

  @override
  List<Object?> get props => [];
}

class ReadQualificationsEvent extends QualificationsEvent {
  final List<Qualifications> qualificationsList;
  const ReadQualificationsEvent({
    required this.qualificationsList,
  });
  @override
  List<Object?> get props => [qualificationsList];
}

class CreateQualEvent extends QualificationsEvent {
  final String id;
  final String name;
  final String college;
  final String university;
  const CreateQualEvent({
    required this.id,
    required this.name,
    required this.college,
    required this.university,
  });
  @override
  List<Object?> get props => [id, name, university, college];
}
