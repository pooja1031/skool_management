import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skool_management/widgets/clipperbackground/customclipper.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
    bool rememberMe = false; 
  bool isPasswordVisible = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final client = http.Client();
      try {
        final response = await client.post(
          Uri.parse('http://skool360-backend.onrender.com/api/v1/auth/login'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode({
            // 'name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'password': _passwordController.text,
          }),
        ).timeout(
          const Duration(seconds: 15),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          if (responseData['data']?['token'] != null) {
            if (!mounted) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            _showError('Invalid response from server');
          }
        } else if (response.statusCode == 307) {
          // Handle redirect manually if needed
          final redirectUrl = response.headers['location'];
          if (redirectUrl != null) {
            final redirectResponse = await client.post(
              Uri.parse(redirectUrl),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
              body: json.encode({
                'name': _nameController.text.trim(),
                'email': _emailController.text.trim(),
                'password': _passwordController.text,
              }),
            );
            
            if (redirectResponse.statusCode == 200) {
              final responseData = json.decode(redirectResponse.body);
              if (responseData['data']?['token'] != null) {
                if (!mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                return;
              }
            }
          }
          _showError('Error connecting to server. Please try again.');
        } else if (response.statusCode == 401) {
          _showError('Invalid credentials');
        } else {
          _showError('Server error (${response.statusCode}). Please try again.');
        }
      } catch (e) {
        print('Error details: $e');
        _showError('Connection error. Please check your internet connection.');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Unexpected error: $e');
      _showError('An unexpected error occurred');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showError(String message) {
    setState(() {
      _errorMessage = message;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: true,

      body: Stack(
        children: [
                Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomWaveClipper(reverse: true),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                color: kcPrimary, 
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (_errorMessage != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                       Text(
                    "Sign In as",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                                    const SizedBox(height: 30),

                  CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              'assets/Student-01.svg',
                              width: 35,
                              height: 35,
                              color: kcPrimary,
                            ),
                          ),
                      SizedBox(height: 100,),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      //  prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) =>
                          value?.trim().isEmpty ?? true ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                       // prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        if (!value!.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      //  prefixIcon: Icon(Icons.lock),
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
                      ),
                      obscureText: true,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your password' : null,
                    ),
                    const SizedBox(height: 24),
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
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimary,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : const Text(
                                'Login',
              style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




