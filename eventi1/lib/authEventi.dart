// ignore_for_file: prefer_const_constructors

import 'package:eventi1/responsive/Mobile.dart';
import 'package:eventi1/screen/Admin/AdminPage.dart';
import 'package:eventi1/screen/Announcer/AnnouncerPage.dart';
import 'package:eventi1/screen/auth/sign_in_page.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/UserProvider.dart';

class AuthEventi extends StatefulWidget {
  const AuthEventi({super.key});

  @override
  State<AuthEventi> createState() => _AuthEventiState();
}

class _AuthEventiState extends State<AuthEventi> {
  bool isLoading = true;

  getDataFromDB() async {
    setState(() {
      isLoading = true;
    });
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromDB();
  }

  @override
  Widget build(BuildContext context) {
    final allDataFromDB =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: primaryPurple,
          ))
        : Scaffold(
            body: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    if (allDataFromDB!.getRole == "User") {
                      return MobileScerren();
                    } else if (allDataFromDB.getRole == "Announcer") {
                      return AnnouncerPage();
                    } else {
                      return AdminPage();
                    }
                  } else {
                    return Signin();
                  }
                }),
          );
  }
}
