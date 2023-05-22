part of 'qualifications_bloc.dart';

enum QualificationsStatus {
  initial,
  loading,
  loaded,
}

class QualificationsState extends Equatable {
  final QualificationsStatus qualificationsStatus;
  final List<Qualifications> qualificationsList;

  const QualificationsState(
      {required this.qualificationsStatus, required this.qualificationsList});

  factory QualificationsState.unknown() {
    return const QualificationsState(
      qualificationsStatus: QualificationsStatus.initial,
      qualificationsList: [],
    );
  }

  @override
  List<Object> get props => [qualificationsStatus, qualificationsList];

  QualificationsState copyWith({
    QualificationsStatus? qualificationsStatus,
    List<Qualifications>? qualificationsList,
  }) {
    return QualificationsState(
      qualificationsStatus: qualificationsStatus ?? this.qualificationsStatus,
      qualificationsList: qualificationsList ?? this.qualificationsList,
    );
  }
}
