import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:timer_button_fork/timer_button_fork.dart';

class SecondSignScreen extends StatefulWidget {
  SecondSignScreen({super.key});

  @override
  State<SecondSignScreen> createState() => _SecondSignScreenState();
}

class _SecondSignScreenState extends State<SecondSignScreen> {
  //* Маска для номера телефона
  var maskFormatter = MaskTextInputFormatter(
      mask: '####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  //*  проверкра на пустоту текстового поля
  var textFieldIsEmpty = true;
  var errorTextVal = false;
  var focusFromTextField = true;
  final _formKey = GlobalKey<FormState>();
  var valid = true;
  Color getColor() {
    if (valid) {
      valid = true;
      return Color.fromARGB(10, 0, 0, 0);
    } else {
      valid = true;
      return Color.fromARGB(5, 255, 0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.only(top: 114),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //*  Главынй текст
              const SizedBox(
                width: 178,
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Text(
                    "Умный дом",
                    style: TextStyle(
                        fontFamily: "SF Pro Rounded",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                  Text(
                    "Интернет и тв",
                    style: TextStyle(
                        fontFamily: "SF Pro Rounded",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                ]),
              ),
              //* Основная форма ввода
              SizedBox(
                width: 292,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //*  Текстовый совет
                    const Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Введите код авторизации,",
                            style: TextStyle(
                                fontFamily: "SF Pro Rounded",
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        Text("полученный в сообщении",
                            style: TextStyle(
                                fontFamily: "SF Pro Rounded",
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20))
                      ],
                    ),
                    //*  Поле для ввода
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                textFieldIsEmpty = false;
                              } else
                                textFieldIsEmpty = true;
                            });
                          },
                          inputFormatters: [maskFormatter],
                          maxLength: 4,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 28),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              counterText: "",
                              contentPadding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              filled: true,
                              fillColor: getColor(),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              errorStyle: const TextStyle(
                                  fontFamily: "SF Pro Rounded",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0,
                                  color: Color.fromARGB(255, 255, 0, 0)),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 255, 0, 0))),
                              hintText: '****',
                              hintStyle: const TextStyle(
                                  fontFamily: "SF Pro Rounded",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28)),
                          validator: (value) {
                            if (value == "0000") {
                              setState(() {
                                valid = false;
                              });
                              return '';
                            } else if (value == null || value.length != 4) {
                              setState(() {
                                valid = false;
                              });
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    //*  Кнопка подтверждения

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                Color.fromARGB(15, 0, 0, 0),
                            backgroundColor: Colors.black,
                            minimumSize: const Size(150, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        onPressed: textFieldIsEmpty
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {}
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             SecondSignScreen()));
                              },
                        child: const Text("подтвердить",
                            style: TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Color.fromARGB(255, 238, 238, 238),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                    //* Код отправлен
                    ArgonTimerButton(
                      initialTimer: 30, // Optional
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.45,
                      minWidth: MediaQuery.of(context).size.width * 0.30,

                      child: Text(
                        "отправить повторно",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(30, 0, 0, 0),
                            fontFamily: "SF Pro Rounded",
                            color: Color.fromARGB(30, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      loader: (timeLeft) {
                        return Text(
                          "код отправлен | $timeLeft",
                          style: TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Color.fromARGB(30, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        );
                      },
                      onTap: (startTimer, btnState) {
                        if (btnState == ButtonState.Idle) {
                          startTimer(30);
                        }
                      },
                    ),
                    // Text("Код отправлен",
                    //     style: TextStyle(
                    //         fontFamily: "SF Pro Rounded",
                    //         color: Color.fromARGB(30, 0, 0, 0),
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 20,
                    //         decorationColor: Color.fromARGB(30, 0, 0, 0)))
                    //* Кнопка повтора
                    // TextButton(
                    //     onPressed: () {},
                    //     child: const Text("отправить повторно",
                    //         style: TextStyle(
                    //             fontFamily: "SF Pro Rounded",
                    //             color: Color.fromARGB(30, 0, 0, 0),
                    //             fontWeight: FontWeight.w400,
                    //             fontSize: 20,
                    //             decoration: TextDecoration.underline,
                    //             decorationColor: Color.fromARGB(30, 0, 0, 0))))
                  ],
                ),
              ),
              //* Комерческая информация (Нижний текст)
              const Padding(
                padding: EdgeInsets.only(bottom: 52),
                child: SizedBox(
                  width: 178,
                  child: Wrap(alignment: WrapAlignment.center, children: [
                    Text(
                      "Сделано в России",
                      style: TextStyle(
                          fontFamily: "SF Pro Rounded",
                          color: Color.fromARGB(60, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "KaspNet & MOiO",
                      style: TextStyle(
                          fontFamily: "SF Pro Rounded",
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
