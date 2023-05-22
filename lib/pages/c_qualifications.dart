import 'package:final_template/blocs/auth/auth_bloc.dart';
import 'package:final_template/blocs/qualifications/qualifications_bloc.dart';
import 'package:final_template/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateQualificationsPage extends StatelessWidget {
  static const String routeName = '/createQuals';
  const CreateQualificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
    TextEditingController universityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Create Dummy Form')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              const Text("Enter Your Qualifications"),
              TextField(
                decoration: const InputDecoration(hintText: 'Enter your name'),
                controller: nameController,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: 'Enter your college name'),
                controller: collegeController,
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: 'Enter your uni name'),
                controller: universityController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                buttonText: 'Create Qualifications',
                buttonColor: Colors.blueAccent,
                buttonWidth: MediaQuery.of(context).size.width * .8,
                buttonHeight: 60,
                isSubmitting: false,
                isOutlined: false,
                buttonAction: () {
                  String uid = context.read<AuthBloc>().state.user!.uid;
                  context.read<QualificationsBloc>().add(CreateQualEvent(
                        id: uid,
                        name: nameController.text.trim(),
                        college: collegeController.text.trim(),
                        university: universityController.text.trim(),
                      ));
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
