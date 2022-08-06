import 'package:clonetiktok/constant.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_input_field.dart';

class SingupScren extends StatefulWidget {
  SingupScren({Key? key}) : super(key: key);

  @override
  State<SingupScren> createState() => _SingupScrenState();
}

class _SingupScrenState extends State<SingupScren> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.timer(_emailController.text, _usernameController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Padding (
          padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tik tok clone",
                  style: TextStyle(
                      fontSize: 35,
                      color: buttonColor,
                      fontWeight: FontWeight.w900),
                ),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      child: Image.asset(
                          "assets/profil_user/download.png",
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,),
                    ),
                    Positioned(
                      left: 80,
                      bottom: 10,
                      child: InkWell(
                        onTap: () => authController.pickImage(),
                        child: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextInputField(
                    controller: _usernameController,
                    labelText: "User name",
                    icon: Icons.person,

                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextInputField(
                    controller: _emailController,
                    labelText: "Email",
                    icon: Icons.email,

                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextInputField(
                    controller: _passwordController,
                    labelText: "PassWord",
                    icon: Icons.lock,
                    isobscure: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    authController.registerUser(
                        _usernameController.text,
                        _emailController.text,
                        _passwordController.text,
                        authController.profilePhoto);
                    authController.timer(_usernameController.text,_emailController.text,_passwordController.text);
                  },
                  child: Container(
                      height: 50,
                      width: size.width * .85,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(width: 5,),
                    InkWell(
                        onTap: () {
                          print("register");
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 15, color: buttonColor),
                        ))
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
