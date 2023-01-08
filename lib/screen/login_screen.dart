import 'package:doctor/core/router.dart';
import 'package:doctor/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  void _auth() {
      Navigator.of(context).pushReplacementNamed(Routes.bottomBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Container(       
        width: double.infinity,
        child: Column( 
          children: [
            _FormWidget(
              onSubmit: _auth,
            ),
            
          ],
        ),
      ),
    ); 
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({required this.onSubmit});
  final void Function() onSubmit;

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  
  String? errorText;

  checkSubmit() {
    final login = _loginTextController.text;
    final passvord = _passwordTextController.text;
    final isCorrectAuth = login == 'admin' && passvord == 'admin';
    if(isCorrectAuth) widget.onSubmit();

    setState(() {
      errorText = isCorrectAuth ? null : 'Невірний логін чи пароль';
    });
  }



  @override
  void dispose() {
    _loginTextController.dispose();
    _passwordTextController.dispose();
    super.dispose(); 
  }


  @override
  Widget build(BuildContext context) {
    
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 55, 59, 15),
    );

    const color = Color(0xFF01B4E4);

    const textFieldDecorator = InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text('Username', style: textStyle,), 
          const SizedBox(height: 5),
          TextField(
            decoration: textFieldDecorator,
            controller: _loginTextController,
          ),
          const SizedBox(height: 15),
          const Text('Password', style: textStyle,),
          const SizedBox(height: 5),
          TextField(
            decoration: textFieldDecorator,
            obscureText: true,
            controller: _passwordTextController,

          ),
          const SizedBox(height: 10),
          if(errorText != null) Text(errorText!, style: const TextStyle(color: Colors.red),),

          Row(
            children: [
              PositivButton(onPressed: checkSubmit, text: 'Увійти',),
              NegativeButton(onPressed: checkSubmit, text: 'Забув пароль',),
            ],
          ),
        ],
      ),
    );
  }
}

