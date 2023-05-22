import 'package:equatable/equatable.dart';

class Qualifications extends Equatable {
  final String name;
  final String college;
  final String university;

  const Qualifications({
    required this.name,
    required this.college,
    required this.university,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'college': college,
        'university': university,
      };

  static Qualifications fromJson(Map<String, dynamic> json) {
    return Qualifications(
      name: json['name'],
      college: json['college'],
      university: json['university'],
    );
  }

  Qualifications copyWith({
    String? name,
    String? college,
    String? university,
  }) {
    return Qualifications(
      name: name ?? this.name,
      college: college ?? this.college,
      university: university ?? this.university,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, college, university];
}
