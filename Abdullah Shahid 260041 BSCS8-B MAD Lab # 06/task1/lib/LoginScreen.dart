import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) return 'Enter email address';
    final regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) return 'Enter password';
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 charactes long containing at least one uppercase letter, one number and one special character';
    }
    return null;
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    // replace page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen App'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 128,
                        margin: const EdgeInsets.only(bottom: 50),
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/logo.png')),
                    Container(
                      child: TextFormField(
                        validator: _validateEmail,
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.mail_outline, color: Colors.grey),
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        validator: _validatePassword,
                        obscureText: _isHidden,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.grey),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text('Remember me'),
                          ],
                        ),
                        Text('Forget Password',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        )),
                        onPressed: _validate,
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
