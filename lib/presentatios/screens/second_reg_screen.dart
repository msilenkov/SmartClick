// import 'dart:async';
// import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// class SecondRegScreen extends StatefulWidget {
//   const SecondRegScreen({super.key});

//   @override
//   State<SecondRegScreen> createState() => _SecondRegScreenState();
// }

// class _SecondRegScreenState extends State<SecondRegScreen> {
//   //* Маска для номера телефона
//   var maskFormatter = MaskTextInputFormatter(
//       mask: '####',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy);

//   var textFieldIsEmpty = true;
//   var errorTextVal = false;
//   var focusFromTextField = true;
//   final _formKey = GlobalKey<FormState>();
//   var valid = true;
//   String textColorKey = 'defaultTextColor';
//   String backgroundColorKey = 'defaultBackgroundColor';
//   String borderColorKey = 'defaultBorderColor';
//   var colorElementMap = {
//     'defaultTextColor': Colors.black,
//     'errorTextColor': const Color.fromRGBO(255, 0, 0, 1),
//     'successTextColor': const Color.fromARGB(255, 0, 255, 55),
//     'defaultBackgroundColor': const Color.fromARGB(10, 0, 0, 0),
//     'errorBackgroundColor': const Color.fromRGBO(255, 0, 0, 0.05),
//     'successBackgroundColor': const Color.fromARGB(15, 0, 255, 55),
//     'defaultBorderColor': const Color.fromARGB(0, 0, 0, 0),
//     'successBorderColor': const Color.fromARGB(255, 0, 255, 55),
//   };

//   Color getColor() {
//     if (valid) {
//       return const Color.fromARGB(10, 0, 0, 0);
//     } else {
//       return const Color.fromARGB(5, 255, 0, 0);
//     }
//   }

//   // void onEnd() {
//   //   print('onEnd');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(255, 238, 238, 238),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 114),
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               //*  Главынй текст
//               SizedBox(
//                 width: 178,
//                 child: Wrap(alignment: WrapAlignment.center, children: const [
//                   AutoSizeText(
//                     "Умный дом",
//                     maxLines: 1,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 28),
//                   ),
//                   AutoSizeText(
//                     "Интернет и тв",
//                     maxLines: 1,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 28),
//                   ),
//                 ]),
//               ),
//               //* Основная форма ввода
//               SizedBox(
//                 width: 292,
//                 height: 261,
//                 child: Column(
//                   children: [
//                     //*  Текстовый совет
//                     Wrap(
//                       alignment: WrapAlignment.center,
//                       children: const [
//                         AutoSizeText("Введите код авторизации,",
//                             maxLines: 1,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 20)),
//                         AutoSizeText("полученный в сообщении",
//                             maxLines: 1,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 20))
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     //*  Поле для ввода
//                     SizedBox(
//                       width: 130,
//                       height: 99,
//                       child: Column(
//                         children: [
//                           Form(
//                             key: _formKey,
//                             child: TextFormField(
//                               textAlignVertical: TextAlignVertical.center,
//                               onEditingComplete: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   setState(() {
//                                     FocusScope.of(context)
//                                         .requestFocus(FocusNode());
//                                   });
//                                   Timer(const Duration(seconds: 2), () {
//                                     Navigator.pushNamed(context, '/');
//                                   });
//                                 }
//                               },
//                               onChanged: (value) {
//                                 setState(() {
//                                   if (value.isNotEmpty) {
//                                     textFieldIsEmpty = false;
//                                   } else {
//                                     textFieldIsEmpty = true;
//                                   }
//                                 });
//                               },
//                               inputFormatters: [maskFormatter],
//                               maxLength: 4,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: colorElementMap[textColorKey],
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 28),
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                   counterText: "",
//                                   contentPadding: const EdgeInsets.only(
//                                       left: 0, right: 0, top: 0, bottom: 0),
//                                   filled: true,
//                                   fillColor:
//                                       colorElementMap[backgroundColorKey],
//                                   border: const OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(13)),
//                                       borderSide: BorderSide(
//                                         width: 0,
//                                       )),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(13)),
//                                       borderSide: BorderSide(
//                                           width: 0,
//                                           color: colorElementMap[borderColorKey]
//                                               as Color)),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(13)),
//                                       borderSide: BorderSide(
//                                         width: 1,
//                                         color: colorElementMap[borderColorKey]
//                                             as Color,
//                                       )),
//                                   focusedErrorBorder: const OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(13)),
//                                       borderSide: BorderSide(
//                                           width: 1,
//                                           color:
//                                               Color.fromARGB(255, 255, 0, 0))),
//                                   errorStyle: const TextStyle(
//                                     fontSize: 0,
//                                   ),
//                                   hintText: '⚹⚹⚹⚹',
//                                   hintStyle: const TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 28)),
//                               validator: (value) {
//                                 if (value == "0000") {
//                                   setState(() {
//                                     valid = false;
//                                     textColorKey = "errorTextColor";
//                                     backgroundColorKey = "errorBackgroundColor";
//                                   });
//                                   return '';
//                                 } else if (value == null || value.length != 4) {
//                                   setState(() {
//                                     valid = false;
//                                     textColorKey = "errorTextColor";
//                                     backgroundColorKey = "errorBackgroundColor";
//                                   });
//                                   return '';
//                                 } else {
//                                   setState(() {
//                                     valid = true;
//                                     textColorKey = "successTextColor";
//                                     backgroundColorKey =
//                                         "successBackgroundColor";
//                                     borderColorKey = 'successBorderColor';
//                                   });
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           valid
//                               ? Container()
//                               : const Padding(
//                                   padding: EdgeInsets.only(top: 22),
//                                   child: AutoSizeText('неверный код',
//                                       maxLines: 1,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 20,
//                                           color:
//                                               Color.fromARGB(255, 255, 0, 0)))),
//                         ],
//                       ),
//                     ),

//                     ArgonTimerButton(
//                       initialTimer: 30,
//                       height: 80,
//                       width: MediaQuery.of(context).size.width * 1,
//                       minWidth: MediaQuery.of(context).size.width * 0.7,
//                       child: const Align(
//                         alignment: Alignment.topCenter,
//                         child: Text(
//                           "отправить повторно",
//                           style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               decorationColor: Color.fromARGB(30, 0, 0, 0),
//                               color: Color.fromARGB(30, 0, 0, 0),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       loader: (timeLeft) {
//                         return Column(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.only(bottom: 10),
//                               child: Text("код отправлен",
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(0, 0, 0, 0.3),
//                                       fontSize: 28,
//                                       fontWeight: FontWeight.w400)),
//                             ),
//                             Container(
//                               width: 91,
//                               height: 30,
//                               alignment: Alignment.center,
//                               decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(0, 0, 0, 0.3),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(99))),
//                               child: Text(
//                                 " $timeLeft сек.",
//                                 style: const TextStyle(
//                                     color: Color.fromRGBO(238, 238, 238, 1),
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                       onTap: (startTimer, btnState) {
//                         if (btnState == ButtonState.Idle) {
//                           startTimer(30);
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               //* Комерческая информация (Нижний текст)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 52),
//                 child: SizedBox(
//                   width: 178,
//                   child: Wrap(alignment: WrapAlignment.center, children: const [
//                     Text(
//                       "Сделано в России",
//                       style: TextStyle(
//                           color: Color.fromARGB(60, 0, 0, 0),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16),
//                     ),
//                     Text(
//                       "KaspNet & MOiO",
//                       style: TextStyle(
//                           color: Color.fromARGB(60, 0, 0, 0),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16),
//                     ),
//                   ]),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
