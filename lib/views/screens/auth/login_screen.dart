import 'package:clonetiktok/constant.dart';
import 'package:clonetiktok/views/screens/auth/singup_screen.dart';
import 'package:clonetiktok/views/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
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
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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

                    authController.loginUser(_emailController.text, _passwordController.text);

                    print("login");
                    _emailController.text = '';
                    _passwordController.text = '';

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
                      "Don't have an account",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(width: 5,),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SingupScren())));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 16, color: buttonColor),
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
