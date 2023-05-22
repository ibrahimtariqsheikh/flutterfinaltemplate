import 'package:final_template/blocs/qualifications/qualifications_bloc.dart';
import 'package:final_template/models/qualifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadQualificationsPage extends StatefulWidget {
  const ReadQualificationsPage({super.key});
  static const String routeName = 'readQuals';

  @override
  State<ReadQualificationsPage> createState() => _ReadQualificationsPageState();
}

class _ReadQualificationsPageState extends State<ReadQualificationsPage> {
  @override
  Widget build(BuildContext context) {
    final qualBloc = context.read<QualificationsBloc>();
    return BlocBuilder<QualificationsBloc, QualificationsState>(
        builder: (context, state) {
      return Scaffold(
        body: StreamBuilder<List<Qualifications>>(
            stream: qualBloc.getQualifications(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final qualificationsList = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          CircleAvatar(child: Text((index + 1).toString())),
                      title: Text(qualificationsList[index].name),
                      subtitle: Text(
                          '${qualificationsList[index].college} ~ ${qualificationsList[index].university}'),
                    );
                  },
                  itemCount: qualificationsList.length,
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            }),
      );
    });
  }
}
