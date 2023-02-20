import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_click/screens/first_sign.dart';

import 'package:smart_click/widgets/info_card.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 57, left: 18, right: 22),
              //* Ряд верхних кнопок
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              disabledBackgroundColor:
                                  const Color.fromARGB(13, 0, 0, 0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              minimumSize: const Size(56, 38),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)))),
                          onPressed: null,
                          child: const Icon(
                            Icons.expand_more,
                            // color: Colors.black,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C14D),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 15),
                              minimumSize: const Size(0, 38),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstSignScreen()));
                          },
                          child: const Text(
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
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor:
                              const Color.fromARGB(13, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 17),
                          minimumSize: const Size(56, 38),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)))),
                      onPressed: null,
                      child: const Icon(
                        Icons.more_horiz,
                        // color: Colors.black,
                      )),
                ],
              ),
            ),
            //* Блок с Текстом

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

            //*  Карточки
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //* Умный дом
                      SizedBox(
                          width: double.infinity,
                          height: 252,
                          child: InfoCard(
                              title: "Умный дом",
                              assetPath: 'assets/images/Icon=Smart.svg',
                              companyName: "MOiO",
                              mainText:
                                  "Используйте современные технологии\nавтоматизации квартиры или загородного\nдома от российских разработчиков.",
                              leftButtonText: "Демо-режим")),
                      //* Интернет и тв
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 252,
                          child: InfoCard(
                              title: "Интернет и ТВ",
                              assetPath: 'assets/images/Icon=Internet.svg',
                              companyName: "KaspNet",
                              mainText:
                                  "Подключайте высокоскоростной интернет\nи телевидение для дома и бизнеса.",
                              leftButtonText: "Тест скорости")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 21, left: 10, right: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99)),
                          child: ListTile(
                              horizontalTitleGap: 10.0,
                              contentPadding:
                                  EdgeInsets.only(left: 38, right: 35),
                              title: const Align(
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
                                  child: const Text(
                                    "Добавить устройство",
                                    style: TextStyle(
                                        fontFamily: "SF Pro Rounded",
                                        color: Color.fromARGB(255, 0, 193, 77),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ))))),
                ),
              ],
            ),
            //* Нижний элемент Card
          ],
        ));
  }
}
