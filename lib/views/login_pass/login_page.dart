import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_food/common/color.dart';
import 'package:order_food/controller/remember_controller.dart';
import 'package:order_food/views/login_pass/reset_password.dart';
import 'package:order_food/views/login_pass/register_page.dart';
import 'package:order_food/views/tabview/main_tabview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool showPassword = false;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  @override
  void dispose(){

    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RememberMeController());
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
              "Sign In",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter email!!");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please enter valid email!!");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailTextController.text = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelStyle: TextStyle(color: ExtensionColor.primary),
                      ),
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextFormField(
                        autofocus: false,
                        obscureText: controller.hidePassword.value,
                        controller: passwordTextController,
                        validator: (value) {
                          RegExp regExp = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required for login");
                          }
                          if (!regExp.hasMatch(value)) {
                            return ("Please Enter Valid Password(6 Char)");
                          }
                        },
                        onSaved: (value) {
                          passwordTextController.text = value!;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelStyle: TextStyle(color: ExtensionColor.primary),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Icons.visibility : Icons.visibility_off),
                          )
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async{
                        loginApp(emailTextController.text,
                            passwordTextController.text);                      
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: ExtensionColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()));
                          },
                          child: const Text("New User?"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ResetPassword()));
                            },
                            child: const Text(
                              "Forgot Password",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "or Login with",
                      style: TextStyle(
                          color: ExtensionColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: signInWithGoogle,
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/google_logo.png",
                              width: 30,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              "Login with google",
                              style: TextStyle(
                                  color: ExtensionColor.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
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

  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    print(userCredential.user?.displayName);

  }

  void loginApp(String email, String password) async {
  final Trace signInTrace = FirebasePerformance.instance.newTrace("signInTrace");
  await signInTrace.start();

  if (_formKey.currentState!.validate()) {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Đánh dấu thành công và lưu lại thông tin người dùng nếu cần
      signInTrace.putAttribute("success", "true");
      signInTrace.putAttribute("userId", userCredential.user!.uid);

      Fluttertoast.showToast(msg: "Successful");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainTabView()),
      );
    } on FirebaseAuthException catch (e) {
      // Lưu lại lỗi xảy ra và đánh dấu thất bại
      signInTrace.putAttribute("success", "false");
      signInTrace.putAttribute("error", e.code);

      Fluttertoast.showToast(msg: "Failed: ${e.message}");
    } finally {
      // Dừng theo dõi hiệu suất cho hành động này
      await signInTrace.stop();
    }
  }
}
}
