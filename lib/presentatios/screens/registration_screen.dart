import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _FirstSignScreenState();
}

class _FirstSignScreenState extends State<RegistrationScreen> {
  //* Маска для номера телефона
  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 ### ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  //*  проверкра на пустоту текстового поля
  var textFieldIsEmpty = true;
  var focusFromTextField = false;

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
              SizedBox(
                width: 292,
                height: 264,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //*  Текстовый совет
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: const [
                        AutoSizeText("Введите ваш номер телефона",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        AutoSizeText("чтобы привязать его к профилю",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20))
                      ],
                    ),
                    const SizedBox(height: 24),
                    //*  Поле для ввода
                    SizedBox(
                      width: 295,
                      height: 55,
                      child: Focus(
                        onFocusChange: (focused) {
                          focusFromTextField = focused ? true : false;
                        },
                        child: TextFormField(
                          initialValue: "+7",
                          onChanged: (value) {
                            setState(() {
                              if (value.length == 16) {
                                textFieldIsEmpty = false;
                              } else {
                                textFieldIsEmpty = true;
                              }
                            });
                          },
                          inputFormatters: [maskFormatter],
                          maxLength: 16,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 28),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              counterText: "",
                              contentPadding: EdgeInsets.only(
                                  left: 11, top: 0, right: 0, bottom: 0),
                              filled: true,
                              fillColor: Color.fromARGB(10, 0, 0, 0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: '+7 000 000 00 00',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 28)),
                        ),
                      ),
                    ),

                    //*  Кнопка подтверждения

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                const Color.fromARGB(15, 0, 0, 0),
                            backgroundColor: Colors.black,
                            minimumSize: const Size(295, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        onPressed: textFieldIsEmpty
                            ? null
                            : () {
                                Navigator.pushNamed(
                                    context, '/secondregscreen');
                              },
                        child: const Text("получить код для входа",
                            style: TextStyle(
                              color: Color.fromARGB(255, 238, 238, 238),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                    const SizedBox(height: 10),
                    //* Кнопка пропуска
                    TextButton(
                        onPressed: () {},
                        child: const Text("пропустить",
                            style: TextStyle(
                                color: Color.fromARGB(30, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromARGB(30, 0, 0, 0))))
                  ],
                ),
              ),
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
