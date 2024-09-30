import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String _selectedUserType = 'Client'; // Default selection

  void signUserUp(BuildContext context) {
    if (_selectedUserType == 'Client') {
      Navigator.pushReplacementNamed(context, '/clientHome');
    } else if (_selectedUserType == 'Service Provider') {
      Navigator.pushReplacementNamed(context, '/serviceProviderHome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/images/Untitled (4).png',
              fit: BoxFit.cover,
            ),
          ),

          // Main content over the background
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const SizedBox(height: 50),

                    // 'Create your account' text
                    Text(
                      'Create your account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Username text field
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    // Password text field
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    // Confirm password text field
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    // User type selection
                    Column(
                      children: [
                        Text('Select User Type:',
                            style: TextStyle(fontSize: 16)),
                        ListTile(
                          title: const Text('Client'),
                          leading: Radio<String>(
                            value: 'Client',
                            groupValue: _selectedUserType,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedUserType = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Service Provider'),
                          leading: Radio<String>(
                            value: 'Service Provider',
                            groupValue: _selectedUserType,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedUserType = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Sign up button
                    MyButton(
                      onTap: () => signUserUp(context),
                      text: 'Sign up',
                    ),

                    const SizedBox(height: 50),

                    // 'Already a member?' prompt
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Sign in');
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
