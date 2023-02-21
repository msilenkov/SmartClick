import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smart_click/screens/second_screen.dart';

class FirstSignScreen extends StatefulWidget {
  FirstSignScreen({super.key});

  @override
  State<FirstSignScreen> createState() => _FirstSignScreenState();
}

class _FirstSignScreenState extends State<FirstSignScreen> {
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
              const SizedBox(
                width: 178,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.01),
                      child: Text(
                        "Умный дом",
                        style: TextStyle(
                            height: 0,
                            fontFamily: "SF Pro Rounded",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 28),
                      ),
                    ),
                    Text(
                      "Интернет и тв",
                      style: TextStyle(
                          height: 0,
                          fontFamily: "SF Pro Rounded",
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
                    const Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Введите ваш номер телефона",
                            style: TextStyle(
                                fontFamily: "SF Pro Rounded",
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        Text("чтобы привязать его к профилю",
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
                              } else
                                textFieldIsEmpty = true;
                            });
                          },
                          inputFormatters: [maskFormatter],
                          maxLength: 16,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                              fontFamily: "SF Pro Rounded",
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
                                  fontFamily: "SF Pro Rounded",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28)),
                        ),
                      ),
                    ),

                    //*  Кнопка подтверждения

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                Color.fromARGB(15, 0, 0, 0),
                            backgroundColor: Colors.black,
                            minimumSize: const Size(295, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        onPressed: textFieldIsEmpty
                            ? null
                            : () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SecondSignScreen()));
                              },
                        child: const Text("получить код для входа",
                            style: TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Color.fromARGB(255, 238, 238, 238),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 10),
                    //* Кнопка пропуска
                    TextButton(
                        onPressed: () {},
                        child: const Text("пропустить",
                            style: TextStyle(
                                fontFamily: "SF Pro Rounded",
                                color: Color.fromARGB(30, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromARGB(30, 0, 0, 0))))
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
