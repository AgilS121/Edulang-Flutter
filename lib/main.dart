import 'package:edulang/pages/Home/home.dart';
import 'package:edulang/pages/Register/register.dart';
import 'package:edulang/services/loginService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edulang/pages/Login/login.dart';
import 'package:edulang/pages/intro/intro.dart';
import 'package:edulang/theme/pallete.dart';
import 'package:flutter/services.dart';

class SewaIn extends StatefulWidget {
  const SewaIn({Key? key}) : super(key: key);

  @override
  _SewaInState createState() => _SewaInState();
}

class _SewaInState extends State<SewaIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SewaIn",
      theme: ThemeData(
        primaryColor: MyColors.bg,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: MyColors.bg,
      ),
      // initialRoute: '/intro',
      getPages: [
        GetPage(name: '/intro', page: () => Intro()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/register', page: () => Register()),
      ],
      home: FutureBuilder(
        future: LoginService().getUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  strokeWidth: 3.0,
                ),
              );
            case ConnectionState.none:
              return Login();
            default:
              if (snapshot.hasData) {
                return HomeView(user: snapshot.data!);
              } else {
                return Login();
              }
          }
        },
      ),
    );
  }
}

Future<void> main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SewaIn());
}
