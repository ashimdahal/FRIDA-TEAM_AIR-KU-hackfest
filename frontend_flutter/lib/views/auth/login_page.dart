import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/views/auth/signup_page.dart';


const inputFieldBorderRadius = 6.0;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     final _formKey = GlobalKey<FormState>();
    
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.2),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: const EmailWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: const PasswordWidget(),
                    ),
          
                    /*
                    login button
                    
                    */
          
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.06),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12.0)),
                          height: size.height * 0.06,
                          width: size.width * 0.8,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
          
                    // Forgot Password Button
          
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.8,
                        child: TextButton(
                            onPressed: () {},
                            child:
                                const Center(child: Text("Forgot Password ?"))),
                      ),
                    ),
          
                    /*
                    
                    Widget that redirects to Sign Up Page
          
                    */
          
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                child: const Text("SignUp")),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "E-mail",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.height * 0.01),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                hintText: "Your Email",
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.purple),
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius))),
                        validator: ((value) {
                           if (value!.isEmpty) {
                            return "email field cannot be empty";
                          } else {
                            return null;
                          }
                        }
          ),
        ),)
      ],
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  var isShown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.1, top: size.height * 0.01),
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.08,
                child: TextFormField(
                  obscureText: !isShown,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                      hintText: "Your Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius)),
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius),
                              ),
                              ),
                              validator: (value){
                                if (value!.isEmpty) {
                            return "password can not be empty";
                          } else {
                            return null;
                          }
                              },
                ),
              ),
              Positioned(
                right: 0,
                child: Align(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isShown = !isShown;
                        });
                      },
                      child: Ink(
                          height: size.height * 0.08,
                          width: size.width * 0.15,
                          child: Center(
                              child: isShown == true
                                  ? const Icon(CupertinoIcons.eye_solid)
                                  : const Icon(
                                      CupertinoIcons.eye_slash_fill)))),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
