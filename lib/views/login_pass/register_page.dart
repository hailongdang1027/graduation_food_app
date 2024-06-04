import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/controller/auth_controller.dart';
import 'package:order_food/views/login_pass/login_page.dart';
import 'package:order_food/views/login_pass/verify_email_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
    
  });
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late UserCredential userCredential;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  RegExp regExp = RegExp(RegisterPage.pattern);
  bool showPassword = true;
  String name = "", email = "", phone="", password = "", confirmPassword = "";
  AuthController controller = Get.put(AuthController());
  

  Country selectedCountry = Country(
    phoneCode: "7", 
    countryCode: "RU", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "Russia", 
    example: "Russia",
    displayName: "Russia",
    displayNameNoCountryCode: "RU", 
    e164Key: ""
  );

  @override
  void dispose(){
    nameTextController.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }
  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      
      

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': nameTextController.text,
        'email': emailTextController.text,
        'phone': phoneTextController.text,
      });

      
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => VerifyEmailPage()));
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            content: Text(
          "Too weak password!",
          style: TextStyle(fontSize: 18),
        ))));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
            content: Text(
          "Account already exist!",
          style: TextStyle(fontSize: 18),
        ))));
      }
    }
  }  

  final _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context) {
    phoneTextController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneTextController.text.length)
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameTextController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Name!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        labelStyle: TextStyle(color: ExtensionColor.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: emailTextController,
                      autocorrect: false,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Email!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelStyle: TextStyle(color: ExtensionColor.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: phoneTextController,
                      autocorrect: false,
                      obscureText: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      onChanged: (value) {
                        setState(() {
                          phoneTextController.text = value;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Phone!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        labelStyle: TextStyle(color: ExtensionColor.primary),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                          child: InkWell(
                            onTap: (){
                              showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500
                                ), 
                                onSelect: (val){
                                  setState(() {
                                    selectedCountry = val;
                                  });
                                }
                              );
                            },
                            child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}", style: const TextStyle(fontSize: 16),),
                          ),
                        ),
                        suffixIcon: phoneTextController.text.length > 9 ? Container(
                          padding: const EdgeInsets.only(bottom: 3),
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 14,
                          ),
                        ): null,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      obscureText: showPassword,
                      controller: passwordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          labelStyle: TextStyle(color: ExtensionColor.primary),
                          suffixIcon: onToggleShowPass()),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      obscureText: showPassword,
                      controller: confirmPasswordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter confirm password!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          labelStyle: TextStyle(color: ExtensionColor.primary),
                          suffixIcon: onToggleShowPass()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (passwordTextController.text !=
                              confirmPasswordTextController.text) {
                            setState(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar((const SnackBar(
                                      content: Text(
                                "Passwords do not match!!",
                                style: TextStyle(fontSize: 18),
                              ))));
                            });
                          } else {
                            setState(() {
                              name = nameTextController.text;
                              email = emailTextController.text;
              
                              password = passwordTextController.text;
                              confirmPassword =
                                  confirmPasswordTextController.text;
                            });
                          }
                        }
                        registration();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 8)),
                      child: const SizedBox(
                        width: 150,
                        child: Text('Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                     
                     
                  ],
                ),
              ),
            )
          ],
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
