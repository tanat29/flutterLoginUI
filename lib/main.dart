import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zz/widgets/button_widget.dart';
import 'package:zz/widgets/textform_widget.dart';
import 'package:zz/widgets/textfrompassword_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));

    emailController.text = "";
    passwordController.text = "";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                TextFormWidget(
                    text: 'อีเมลล์',
                    readOnly: false,
                    controller: emailController,
                    type: TextInputType.text,
                    inputFormat: []),
                const SizedBox(height: 12),
                TextFormPasswordWidget(
                  text: 'รหัสผ่าน',
                  controller: passwordController,
                  hidePassword: hidePassword,
                  icon: IconButton(
                    icon: hidePassword
                        ? const Icon(
                            Icons.visibility_outlined,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                          ),
                    onPressed: () => setState(() {
                      hidePassword = !hidePassword;
                    }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  label: 'เข้าสู่ระบบ',
                  color: Colors.blue,
                  onPressed: () => saveData(),
                )
              ],
            ),
          )),
    )));
  }

  Widget buildHeader() => Column(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 130,
          ),
          const Text(
            'ยินดีต้อนรับ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff006d38)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'หน้าล็อกอินสำหรับเข้าสู่ระบบ',
            style: TextStyle(fontSize: 18, color: Color(0xff006d38)),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  void saveData() {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();

    print('$email $password');
  }
}
