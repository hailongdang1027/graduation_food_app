import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_food/common/color.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController oldPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String newPassword = "", oldPassword = "", confirmPassword = "";
  var currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Password has been changed!!!",
        style: TextStyle(fontSize: 18),
      )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password can't be changed!!!" + e.toString(),
        style: const TextStyle(fontSize: 18),
      )));
    }
  }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 55,
              ),
              Text(
                "Change pasword",
                style: TextStyle(
                    color: ExtensionColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 26,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: !showPassword,
                        controller: oldPasswordTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Old password",
                            labelStyle:
                                TextStyle(color: ExtensionColor.primary),
                            suffixIcon: onToggleShowPass()),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      TextFormField(
                        obscureText: !showPassword,
                        controller: newPasswordTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter new password';
                          }else if(oldPasswordTextController == newPasswordTextController){
                            return 'New password should not be same old password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "New password",
                            labelStyle:
                                TextStyle(color: ExtensionColor.primary),
                            suffixIcon: onToggleShowPass()),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      TextFormField(
                        obscureText: !showPassword,
                        controller: textConfirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter confirm password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            labelStyle:
                                TextStyle(color: ExtensionColor.primary),
                            suffixIcon: onToggleShowPass()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                 if (newPasswordTextController.text !=
                                    textConfirmPasswordController.text) {
                                  setState(() {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar((const SnackBar(
                                            content: Text(
                                      "Passwords do not match!!",
                                      style: TextStyle(fontSize: 18),
                                    ))));
                                  });
                                }
                              }else{
                                setState(() {
                                  oldPassword = oldPasswordTextController.text;
                                  newPassword = newPasswordTextController.text;
                                  confirmPassword = textConfirmPasswordController.text;
                                });
                                changePassword();
                              }
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget onToggleShowPass() {
    return IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon:
            showPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off));
  }
}
