import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/ui/common_widgets/form_components.dart';

class Register extends StatefulWidget {
  final Function() moveToLogin;
  final Function(User) onRegister;
  const Register({super.key, required this.moveToLogin, required this.onRegister});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String educationLevelValue = "Undergraduate";
  final User _user = User.blankUser();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.3,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            CoreComponents.header("Create An Account", size),
            CoreComponents.middleSpace(size),
            CoreComponents.formTextField(
                label: "Full Name", obscureText: false, onSaved: (value) {
                  _user.fullName = value!;
            }),
            CoreComponents.middleSpace(size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.16,
                  child: CoreComponents.formTextField(
                      label: "Email", obscureText: false, onSaved: (value) {
                        _user.email = value!;
                  }),
                ),
                SizedBox(
                  width: size.width * 0.125,
                  child: CoreComponents.formTextField(
                      label: "Password",
                      obscureText: true,
                      onSaved: (value) {
                        _user.password = value!;

                      }),
                ),
              ],
            ),
            CoreComponents.middleSpace(size),
            CoreComponents.formTextField(
                label: "Username",
                obscureText: false,
                onSaved: (value) {
                  _user.username = value!;
                }),
            CoreComponents.middleSpace(size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.21,
                  child: CoreComponents.formTextField(
                      label: "Core Concentration / Major",
                      obscureText: false,
                      onSaved: (value) {
                        _user.major = value!;
                      }),
                ),
                SizedBox(
                  width: size.width * 0.07,
                  child: CoreComponents.dropdownField(
                      label: "Education Level",
                      selectedValue: educationLevelValue,
                      size: size,
                      dropdownItems: {
                        "Grade 1 - 5": "Grade 1 - 5",
                        "Grade 5 - 8": "Grade 5 - 8",
                        "Undergraduate": "Undergraduate",
                        "Masters": "Masters"
                      },
                      onChanged: (value) {
                        setState(() {
                          educationLevelValue = value!;
                        });
                        _user.eduLevel = value!;
                      }),
                ),

              ],
            ),
            CoreComponents.middleSpace(size),
            CoreComponents.formTextField(
                label: "Institution Name ",
                obscureText: false,
                onSaved: (value) {
                  _user.instituteName = value!;
                }),
            CoreComponents.middleSpace(size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                TextButton(onPressed: widget.moveToLogin, child: Text("Already have an account? Login!"))
              ],
            ),
            SizedBox(
              width: size.width * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    widget.onRegister(_user);
                  }
                },
                child: Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
