// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'package:tessera/constants/constants.dart';
import 'package:tessera/constants/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tessera/constants/enums.dart';
import 'package:tessera/features/authentication/cubit/email_auth_cubit.dart';

class LoginSignup extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  String inputEmail = '';

  LoginSignup({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Log in or Sign up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(kPagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(),
                        hintText: 'Enter email address',
                      ),
                      validator: (value) {
                        inputEmail = value!;
                        if (inputEmail.trim().isEmpty) {
                          return 'email is required';
                        }
                        if (!EmailValidator.validate(inputEmail)) {
                          return 'this is not a valid email';
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(kPagePadding),
                // ignore: prefer_const_constructors
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: Transform.rotate(
                              angle: 90 * pi / 180,
                              child: const Icon(
                                Icons.confirmation_num_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                              "Sign in with the same email addrerss you used to get your tickets."),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            // print(context
                            //     .read<EmailAuthCubit>()
                            //     .emailAuthentication(inputEmail));
                            if (await context
                                    .read<EmailAuthCubit>()
                                    .emailAuthentication(inputEmail) ==
                                UserState.login) {
                              Navigator.pushNamed(context, '/login');
                            } else {
                              Navigator.pushNamed(context, '/signup');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.buttonColor, // Background Color),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
