
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:order_food/controller/auth_controller.dart';
import 'package:order_food/views/login_pass/login_page.dart';
import 'package:order_food/views/login_pass/main_auth_page.dart';
import 'package:order_food/views/pages/foods_page.dart';
import 'package:order_food/views/pages/food_detail.dart';
import 'package:order_food/views/success_result/success.dart';



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Trace myTrace = FirebasePerformance.instance.newTrace("test_trace");
  myTrace.start();
  runApp(
    const ProviderScope(child: MyApp())
  );
  myTrace.stop();
  
}

Future<String?> getIdToken() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String? idToken = await user.getIdToken(true);
    print("ID Token: $idToken");
    return idToken;
  } else {
    print("No user is signed in.");
    return null;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    getIdToken();
    @override
    void initState(){
      super.initState();
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MainAuthPage(),
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        '/foods': (BuildContext context) => const FoodsPage(),
        '/food-details': (BuildContext context) => const FoodDetail(),
        '/login': (BuildContext context) => const LoginPage(),
        '/success': (context) => const SuccessView()
      },
    );

  }
}
