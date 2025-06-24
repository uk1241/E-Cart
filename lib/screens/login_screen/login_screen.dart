import 'package:e_cart/screens/login_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

/// LoginScreen handles login UI including social sign-in, email/password input,
/// visibility toggle, remember me checkbox, and navigation to sign-up screen.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true; // Controls password field visibility
  bool _rememberMe = false; // Stores state of "Remember me" checkbox

  Future<void> _goToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF6E5),
              Color(0xFFE5E7FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500, // Keep login card width fixed on large screens
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Login Card container
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Gradient heading text
                                ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                        colors: [
                                          Color(0xFF4983F6),
                                          Color(0xFFC175F5),
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      ),
                                  child: const Text(
                                    'Get Started now',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Create an account or log in to explore our app',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),

                                // // Google Sign-in Button
                                // SocialButton(
                                //   imagePath: 'assets/buttonIcons/google.png',
                                //   label: 'Sign in with Google',
                                //   onTap: () {},
                                // ),
                                // const SizedBox(height: 10),
                                //
                                // // Facebook Sign-in Button
                                // SocialButton(
                                //   imagePath: 'assets/buttonIcons/facebook.png',
                                //   label: 'Sign in with Facebook',
                                //   onTap: () {},
                                // ),

                                // const SizedBox(height: 20),

                                // Divider with "Or"
                                Row(
                                  children: const [
                                    Expanded(child: Divider()),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Text("Or"),
                                    ),
                                    Expanded(child: Divider()),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // Email input
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Email"),
                                ),
                                const SizedBox(height: 6),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // Password input with visibility toggle
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Password"),
                                ),
                                const SizedBox(height: 6),
                                TextField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // // Remember Me & Forgot Password row
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Checkbox(
                                //           value: _rememberMe,
                                //           onChanged: (value) {
                                //             setState(() {
                                //               _rememberMe = value ?? false;
                                //             });
                                //           },
                                //         ),
                                //         const Text("Remember me"),
                                //       ],
                                //     ),
                                //     TextButton(
                                //       onPressed: () {},
                                //       child: const Text(
                                //         "Forgot Password ?",
                                //         style: TextStyle(
                                //           color: Color(0xFF1976D2),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                const SizedBox(height: 6),

                                // Log In button with gradient background
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF2196F3),
                                          Color(0xFF1976D2),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // TODO: Implement login logic
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Log In",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Sign Up navigation row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              TextButton(
                                onPressed: _goToSignUp,
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Color(0xFF1976D2)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
