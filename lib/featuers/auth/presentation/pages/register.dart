import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/presentation/cubit/authentication_cubit.dart';
import 'package:grovia/shared/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  final UserRole role;
  const RegisterScreen({super.key, required this.role});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeLogoUrlController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    storeNameController.dispose();
    storeLogoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register as ${widget.role.name}'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            LinearProgressIndicator();
            print('Loading...');
          } else if (state is AuthenticationAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Welcome ${state.user.name}! allrady have account',
                ),
                backgroundColor: Colors.green,
              ),
            );
            print('User authenticated: ${state.user.name}');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => true,
            );
          } else if (state is AuthenticationError) {
            if (state.message.contains('email-already-in-use')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'This email is already registered. Please log in.',
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  action: SnackBarAction(
                    label: 'Login',
                    textColor: Theme.of(context).colorScheme.onError,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      ); // الانتقال لصفحة تسجيل الدخول
                    },
                  ),
                ),
              );
              print('Registration failed: Email already in use.');
            } else {
              // الأخطاء الأخرى
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              print('Registration failed: ${state.message}');
            }
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.person_pin,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: "Name",
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        filled: true,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: "Email",
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        filled: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: "Password",
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        controller: passwordController,
                        obscureText: obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        labelText: "Phone",
                        hintText: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        filled: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      if (widget.role == UserRole.merchant) ...[
                        CustomTextFormField(
                          labelText: "Store Name",
                          hintText: 'Store Name',
                          prefixIcon: Icon(Icons.store),
                          controller: storeNameController,
                          filled: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your store name';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          labelText: "Store Logo URL",
                          hintText: 'Store Logo URL',
                          prefixIcon: Icon(Icons.image),
                          controller: storeLogoUrlController,
                          filled: true,
                        ),
                      ],
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            50,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<AuthenticationCubit>().signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              role: widget.role,
                              storeName: widget.role == UserRole.merchant
                                  ? storeNameController.text
                                  : '',
                            );
                            print('Registering user: ${emailController.text}');
                          }
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
