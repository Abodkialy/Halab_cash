import 'package:flutter/material.dart';
import 'package:halab_cash/componants/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halab_cash/screens/MainWrapper.dart';

class AuthTabsScreen extends StatelessWidget {
  const AuthTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/logo.png', height: 100, width: 100),
            SizedBox(height: 20),
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [Tab(text: 'تسجيل الدخول'), Tab(text: 'إنشاء حساب')],
            ),
            Expanded(
              child: TabBarView(children: [LoginForm(), RegisterForm()]),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);

      print("تم تسجيل الدخول: ${userCredential.user?.email}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainWrapper()),
      );
    } catch (e) {
      print("فشل تسجيل الدخول: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل تسجيل الدخول: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Inputfiled(
          labelText: 'الاسم',
          hintText: "الاسم",
          controller: _usernameController,
        ),
        SizedBox(height: 16),
        Inputfiled(
          labelText: 'كلمة المرور',
          hintText: "********",
          obscureText: true,
          controller: _passwordController,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E6C4C),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(' تسجيل دخول', style: TextStyle(color: Color(0xFF1E6C4C))),
            SizedBox(width: 8),
            Text(' ليس لديك حساب ؟ '),
          ],
        ),
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('الرجاء ملء جميع الحقول')));
      return;
    }

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print("تم إنشاء الحساب: ${userCredential.user?.email}");

      await userCredential.user?.updateDisplayName(name);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب بنجاح')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainWrapper()),
      );
    } catch (e) {
      print("فشل إنشاء الحساب: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل إنشاء الحساب: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Inputfiled(
          labelText: 'الاسم',
          hintText: "الاسم",
          controller: _nameController,
        ),
        const SizedBox(height: 16),
        Inputfiled(
          labelText: 'البريد الإلكتروني',
          hintText: "example@mail.com",
          controller: _emailController,
        ),
        const SizedBox(height: 16),
        Inputfiled(
          labelText: 'كلمة المرور',
          hintText: "********",
          controller: _passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _register,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E6C4C),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'إنشاء حساب',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
