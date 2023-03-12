import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartclick/logic/cubits/auth/register_cubit.dart';
import 'package:smartclick/presentatios/widgets/authorization.dart';
import 'package:smartclick/presentatios/widgets/registration.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _FirstSignScreenState();
}

class _FirstSignScreenState extends State<RegistrationScreen> {
  // //* Маска для номера телефона
  // var maskFormatter = MaskTextInputFormatter(
  //     mask: '+7 ### ### ## ##',
  //     filter: {"#": RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy);
  // //*  проверкра на пустоту текстового поля
  // var textFieldIsEmpty = true;
  // var focusFromTextField = false;

  var res = 1;

  // UserApi userApi = UserApi();
  // final inputNumber = TextEditingController(text: '+7');
  // @override
  // void dispose() {
  //   super.dispose();
  //   // Clean up the controller when the widget is disposed.
  //   inputNumber.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.only(top: 114),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //*  Главынй текст
              SizedBox(
                width: 178,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.01),
                      child: AutoSizeText(
                        "Умный дом",
                        maxLines: 1,
                        style: TextStyle(
                            height: 0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 28),
                      ),
                    ),
                    AutoSizeText(
                      "Интернет и тв",
                      maxLines: 1,
                      style: TextStyle(
                          height: 0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              //* Основная форма ввода
              SizedBox(child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                if (state.register == "notregistered") {
                  return const Registration();
                } else if (state.register == "registering") {
                  return const Autorization();
                } else {
                  return const Registration();
                }
              })),

              //* Комерческая информация (Нижний текст)
              Padding(
                padding: const EdgeInsets.only(bottom: 52),
                child: SizedBox(
                  width: 178,
                  child: Wrap(alignment: WrapAlignment.center, children: const [
                    Text(
                      "Сделано в России",
                      style: TextStyle(
                          color: Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "KaspNet & MOiO",
                      style: TextStyle(
                          color: Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
