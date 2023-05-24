import 'package:eventi1/Classes/Regestration.dart';
import 'package:eventi1/Provider/FavoriteProvider.dart';
import 'package:eventi1/Provider/Regestrations_provider.dart';
import 'package:eventi1/Provider/UserProvider.dart';
import 'package:eventi1/authEventi.dart';
import 'package:eventi1/firebase_options.dart';
import 'package:eventi1/responsive/Responsive.dart';
import 'package:eventi1/responsive/Web.dart';
import 'package:eventi1/screen/auth/sign_in_page.dart';
import 'package:eventi1/screen/auth/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "eventi-9e670",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) {
            return FavoriteProvider();
          },
        ),
        ChangeNotifierProvider<RegestrationsProvoder>(
          create: (context) {
            return RegestrationsProvoder();
          },
        ),
        ChangeNotifierProvider<Regestraion>(
          create: (context) {
            return Regestraion();
          },
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) {
            return UserProvider();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        home: Responsive(
          myMobileScreen: Signin(),
          myWebScreen: WebScerren(),
        ),
      ),
    );
  }
}






















// import 'package:flutter/material.dart';
// import 'package:instagram_app/Class/Regestration.dart';
// import 'package:instagram_app/Provider/Favorite.dart';
// import 'package:instagram_app/Provider/Regestrations.dart';
// import 'package:instagram_app/responsive/mobile.dart';
// import 'package:instagram_app/responsive/responsive.dart';
// import 'package:instagram_app/responsive/web.dart';
// import 'package:instagram_app/screens/Signup.dart';
// import 'package:provider/provider.dart';
// import 'package:instagram_app/screens/Signin.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: "eventi-9e670",
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<Favorite>(
//           create: (context) {
//             return Favorite();
//           },
//         ),
//         ChangeNotifierProvider<Regestrations>(
//           create: (context) {
//             return Regestrations();
//           },
//         ),
//         ChangeNotifierProvider<Regestraion>(
//           create: (context) {
//             return Regestraion();
//           },
//         ),
//       ],
//       child: const MaterialApp(
//         debugShowMaterialGrid: false,
//         debugShowCheckedModeBanner: false,
//         home: Responsive(
//           myMobileScreen: Signup(),
//           myWebScreen: WebScerren(),
//         ),
//       ),
//     );
//   }
// }
