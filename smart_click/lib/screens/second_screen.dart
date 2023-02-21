import 'dart:async';

import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smart_click/screens/enter_screen.dart';

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

  var textFieldIsEmpty = true;
  var errorTextVal = false;
  var focusFromTextField = true;
  final _formKey = GlobalKey<FormState>();
  var valid = true;
  String textColorKey = 'defaultTextColor';
  String backgroundColorKey = 'defaultBackgroundColor';
  String borderColorKey = 'defaultBorderColor';
  var colorElementMap = {
    'defaultTextColor': Colors.black,
    'errorTextColor': Color.fromRGBO(255, 0, 0, 1),
    'successTextColor': Color.fromARGB(255, 0, 255, 55),
    'defaultBackgroundColor': Color.fromARGB(10, 0, 0, 0),
    'errorBackgroundColor': Color.fromRGBO(255, 0, 0, 0.05),
    'successBackgroundColor': Color.fromARGB(15, 0, 255, 55),
    'defaultBorderColor': Color.fromARGB(0, 0, 0, 0),
    'successBorderColor': Color.fromARGB(255, 0, 255, 55),
  };

  Color getColor() {
    if (valid) {
      return Color.fromARGB(10, 0, 0, 0);
    } else {
      return Color.fromARGB(5, 255, 0, 0);
    }
  }

  void onEnd() {
    print('onEnd');
  }

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
                height: 261,
                child: Column(
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
                    SizedBox(height: 24),
                    //*  Поле для ввода
                    SizedBox(
                      width: 130,
                      height: 99,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              onEditingComplete: () {
                                if (_formKey.currentState!.validate()) {
                                  Timer(Duration(seconds: 3), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EnterScreen()));
                                  });
                                }
                              },
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
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "SF Pro Rounded",
                                  color: colorElementMap[textColorKey],
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counterText: "",
                                  contentPadding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  filled: true,
                                  fillColor:
                                      colorElementMap[backgroundColorKey],
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                        width: 0,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                          width: 0,
                                          color: colorElementMap[borderColorKey]
                                              as Color)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: colorElementMap[borderColorKey]
                                            as Color,
                                      )),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 255, 0, 0))),
                                  errorStyle: const TextStyle(
                                    fontSize: 0,
                                  ),
                                  hintText: '⚹⚹⚹⚹',
                                  hintStyle: const TextStyle(
                                      // fontFamily: "SF Pro Rounded",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28)),
                              validator: (value) {
                                if (value == "0000") {
                                  setState(() {
                                    valid = false;
                                    textColorKey = "errorTextColor";
                                    backgroundColorKey = "errorBackgroundColor";
                                  });
                                  return '';
                                } else if (value == null || value.length != 4) {
                                  setState(() {
                                    valid = false;
                                    textColorKey = "errorTextColor";
                                    backgroundColorKey = "errorBackgroundColor";
                                  });
                                  return '';
                                } else {
                                  setState(() {
                                    valid = true;
                                    textColorKey = "successTextColor";
                                    backgroundColorKey =
                                        "successBackgroundColor";
                                    borderColorKey = 'successBorderColor';
                                  });
                                }
                                return null;
                              },
                            ),
                          ),
                          valid
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Positioned(
                                      bottom: 0,
                                      child: Text('неверный код',
                                          style: TextStyle(
                                              fontFamily: "SF Pro Rounded",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 255, 0, 0)))),
                                )
                        ],
                      ),
                    ),

                    ArgonTimerButton(
                      initialTimer: 30,
                      height: 80,
                      width: MediaQuery.of(context).size.width * 1,
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          "отправить повторно",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(30, 0, 0, 0),
                              fontFamily: "SF Pro Rounded",
                              color: Color.fromARGB(30, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      loader: (timeLeft) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: const Text("код отправлен",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Rounded",
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              width: 91,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(99))),
                              child: Text(
                                " $timeLeft сек.",
                                style: TextStyle(
                                    fontFamily: "SF Pro Rounded",
                                    color: Color.fromRGBO(238, 238, 238, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        );
                      },
                      onTap: (startTimer, btnState) {
                        if (btnState == ButtonState.Idle) {
                          startTimer(30);
                        }
                      },
                    ),
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
