import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../utils/email_validator.dart';
import 'login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
        provider: loginProvider,
        builder: (_, controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Container(
                      alignment: Alignment
                          .center, // Establecer la alineación al centro
                      child: const Text(
                        'POR FAVOR LLENA TUS DATOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 212, 87),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                    SizedBox(
                      height: 215,
                      width: 290,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            width: 3,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13, 12, 13, 0),
                          child: Column(
                            children: [
                              FormField<String>(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (text) {
                                    if (text == null) {
                                      return "invalid email";
                                    }
                                    return isValidEmail(text)
                                        ? null
                                        : "invalid email";
                                  },
                                  builder: (state) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          onChanged: (text) {
                                            controller.onEmailChanged(text);
                                            state.setValue(text);
                                            state.validate();
                                            // ignore: invalid_use_of_protected_member
                                          },
                                          decoration: InputDecoration(
                                            labelText: "E-mail",
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: Image.asset(
                                                  'assets/icono_correo.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 189, 185, 185),
                                              ),
                                            ),
                                          ),
                                          cursorColor: Colors.green,
                                        ),
                                        if (state.hasError)
                                          Text(
                                            state.errorText!,
                                            style: const TextStyle(
                                                color: Colors.green),
                                          )
                                      ],
                                    );
                                  }),
                              FormField<String>(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (text) {
                                    if (text == null) {
                                      return "invalid password";
                                    }
                                    if (text.trim().length >= 6) {
                                      return null;
                                    }
                                    return "invalid password";
                                  },
                                  builder: (state) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          obscureText: true,
                                          onChanged: (text) {
                                            controller.onPasswordChanged(text);
                                            state.setValue(text);
                                            state.validate();
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Contraseña',
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: Image.asset(
                                                  'assets/icono_candado.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                        if (state.hasError)
                                          Text(
                                            state.errorText!,
                                            style: const TextStyle(
                                                color: Colors.green),
                                          )
                                      ],
                                    );
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 24.0,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Text(
                                    'Recordar cuenta',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 82, 212, 87),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.formKey.currentState!.validate();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 212, 87),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(250, 40),
                      ),
                      child: const Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
