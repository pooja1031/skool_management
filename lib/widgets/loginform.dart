import 'package:flutter/material.dart';
import 'package:skool_management/signup/verification.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class LoginFormStudent extends StatefulWidget {
  const LoginFormStudent({super.key});

  @override
  State<LoginFormStudent> createState() => _LoginFormStudentState();
}

class _LoginFormStudentState extends State<LoginFormStudent> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = false; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Parent/Guardian Email",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], 
            borderRadius: BorderRadius.circular(8.0), 
          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              border: InputBorder.none, 
             // prefixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], 
            borderRadius: BorderRadius.circular(8.0), 
          ),
          child: TextField(
            controller: passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              border: InputBorder.none, 
             // prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: kcPrimary,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  activeColor: kcPrimary, 
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                print("Forgot Password tapped");
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 14, color: kcPrimary),
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              print("Email: $email, Password: $password");
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerificationScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
