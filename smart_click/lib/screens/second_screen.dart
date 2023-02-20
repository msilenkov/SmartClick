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

  Color getColor() {
    if (valid) {
      return Color.fromARGB(10, 0, 0, 0);
    } else {
      return Color.fromARGB(5, 255, 0, 0);
    }
  }

  Color getBorderColor() {
    if (valid) {
      return Color.fromARGB(0, 0, 0, 0);
    } else {
      return Color.fromARGB(255, 255, 0, 0);
    }
  }

  BorderSide getBorder() {
    if (valid) {
      return BorderSide(
        width: 0,
        style: BorderStyle.none,
      );
    } else {
      return BorderSide(
        width: 1,
        style: BorderStyle.solid,
      );
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
                      height: 99,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              onEditingComplete: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EnterScreen()));
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
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: "SF Pro Rounded",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counterText: "",
                                  contentPadding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  filled: true,
                                  fillColor: getColor(),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: getBorder()),
                                  errorStyle: const TextStyle(
                                    fontSize: 0,
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 255, 0, 0))),
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
                                } else {
                                  setState(() {
                                    valid = true;
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
