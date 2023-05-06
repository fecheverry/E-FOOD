import 'package:e_food/app/ui/pages/auth/register/controller/register_controller.dart';
import 'package:e_food/app/ui/pages/auth/register/controller/register_state.dart';
import 'package:e_food/app/ui/pages/auth/register/utils/send_register_form.dart';
import 'package:e_food/app/utils/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../utils/name_validator.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'POR FAVOR LLENA TUS DATOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 82, 212, 87),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 380,
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
                        padding: const EdgeInsets.fromLTRB(13, 12, 13, 10),
                        child: Column(
                          children: [
                            FormField<String>(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if (text == null) {
                                    return "invalid name";
                                  }
                                  return isValidName(text)
                                      ? null
                                      : "invalid name";
                                },
                                builder: (state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        onChanged: (text) {
                                          controller.onNameChanged(text);
                                          state.setValue(text);
                                          state.validate();
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Tu nombre',
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                'assets/icono_perfil.png',
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
                            Consumer(
                              builder: (_, ref, __) {
                                ref.watch(
                                    registerProvider.select((_) => _.password));

                                return FormField<String>(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (text) {
                                      if (text == null) {
                                        return "invalid password";
                                      }
                                      if (controller.state.password != text) {
                                        return "password don't match";
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
                                              controller
                                                  .onVPasswordChange(text);
                                              state.setValue(text);
                                              state.validate();
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Repita la Contraseña',
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
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
                                                    color:
                                                        Colors.grey.shade300),
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
                                    });
                              },
                            ),
                            const SizedBox(height: 35.0),
                            const Text(
                              'Leer términos y condiciones',
                              style: TextStyle(
                                color: Color.fromARGB(255, 82, 212, 87),
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    'Acepto los términos y condiciones',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 82, 212, 87),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 250,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => sendRegisterForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 212, 87),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        'REGISTRARSE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
