import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'Flutter Demo',
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 238, 238, 238),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 18, right: 22),
                  //* Ряд верхних кнопок
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 17)),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(56, 38)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13))))),
                              onPressed: null,
                              child: Icon(
                                Icons.expand_more,
                                // color: Colors.black,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF00C14D)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 15)),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(0, 38)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13))))),
                              onPressed: () {},
                              child: Text(
                                'Привязать номер',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: "SF Pro Rounded"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 17)),
                              minimumSize:
                                  MaterialStateProperty.all(Size(56, 38)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))))),
                          onPressed: null,
                          child: Icon(
                            Icons.more_horiz,
                            // color: Colors.black,
                          )),
                    ],
                  ),
                ),
                //* Блок с Текстом
                SizedBox(
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
                //* Спсиок
                //? Туду ниже под вопросом

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 510,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //* Умный дом
                        SizedBox(
                            width: double.infinity,
                            height: 252,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 36),
                                //* Общий лемент
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //* Элемент с кнопками
                                    SizedBox(
                                      width: double.infinity,
                                      height: 108,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/images/Icon=Smart.svg'),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
                                                      child: Text("Умный дом",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SF Pro Rounded",
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text("MOiO",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.3),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20))
                                            ],
                                          ),
                                          Text(
                                              "Используйте современные технологии\nавтоматизации квартиры или загородного\nдома от российских разработчиков.",
                                              style: TextStyle(
                                                  fontFamily: "SF Pro Rounded",
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16)),
                                        ],
                                      ),

                                      //* Элемент с кнопками
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //* Кнопка Демо-режим
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Демо-режим",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFFEEEEEE)),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(150, 74)),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(13)))))),
                                          //* Кнопка Подключить
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Подключить",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF00C14D)),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(150, 74)),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(13)))))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36)),
                            )),
                        //* Интернет и тв
                        SizedBox(
                            width: double.infinity,
                            height: 252,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 36, vertical: 30),
                                //* Общий лемент
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //* Элемент с кнопками
                                    SizedBox(
                                      width: double.infinity,
                                      height: 108,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/images/Icon=Internet.svg'),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
                                                      child: Text(
                                                          "Интернет и ТВ ",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "SF Pro Rounded",
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text("KaspNet",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.3),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20))
                                            ],
                                          ),
                                          Text(
                                              "Подключайте высокоскоростной интернет\nи телевидение для дома и бизнеса.",
                                              style: TextStyle(
                                                  fontFamily: "SF Pro Rounded",
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16)),
                                        ],
                                      ),

                                      //* Элемент с кнопками
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //* Кнопка Тест скорости
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Тест скорости",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFFEEEEEE)),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(150, 74)),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(13)))))),
                                          //* Кнопка Подключить
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Подключить",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "SF Pro Rounded",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF00C14D)),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(150, 74)),
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(13)))))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36)),
                            )),
                      ],
                    ),
                  ),
                ),
                //* Нижний элемент Card
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 21, left: 10, right: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99)),
                          child: ListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Мой дом",
                                  style: TextStyle(
                                      fontFamily: "SF Pro Rounded",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              leading: SvgPicture.asset(
                                  'assets/images/Icon=Smart.svg'),
                              trailing: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Добавить устройство",
                                    style: TextStyle(
                                        fontFamily: "SF Pro Rounded",
                                        color: Color.fromARGB(255, 0, 193, 77),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ))))),
                ),
              ],
            )));
  }
}
