import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skool_management/models/registration_model.dart';

class RegistrationViewModel extends ChangeNotifier {
  RegistrationModel _model = RegistrationModel();
  bool _isLoading = false;
  String? _errorMessage;

  RegistrationModel get model => _model;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isValid => _validateEmail() && _validatePassword() && _validateName();

  bool _validateEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(_model.email);
  }

  bool _validatePassword() {
    return _model.password.length >= 6;
  }

  bool _validateName() {
    return _model.name.trim().length >= 2;
  }

  void updateEmail(String email) {
    _model = _model.copyWith(email: email);
    _errorMessage = null;
    notifyListeners();
  }

  void updatePassword(String password) {
    _model = _model.copyWith(password: password);
    _errorMessage = null;
    notifyListeners();
  }

  void updateName(String name) {
    _model = _model.copyWith(name: name);
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> register() async {
    if (!isValid) {
      _errorMessage = 'Please fill all fields correctly';
      notifyListeners();
      return false;
    }

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));
      
     

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Registration failed: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }
}



class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegistrationViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              onChanged: viewModel.updateName,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: viewModel.updateEmail,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: viewModel.updatePassword,
            ),
            const SizedBox(height: 24),
            if (viewModel.errorMessage != null)
              Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: viewModel.isLoading
                  ? null
                  : () async {
                      if (await viewModel.register()) {
                        if (context.mounted) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                      }
                    },
              child: viewModel.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}