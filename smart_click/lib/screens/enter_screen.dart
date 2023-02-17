import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_click/widgets/info_card.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
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
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF00C14D)),
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
                          minimumSize: MaterialStateProperty.all(Size(56, 38)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))))),
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

            //* 2 Карточки
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                height: 510,
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
            ),
            //* Нижний элемент Card
            Padding(
              padding: const EdgeInsets.only(bottom: 21, left: 10, right: 10),
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
                          leading:
                              SvgPicture.asset('assets/images/Icon=Smart.svg'),
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
        ));
  }
}
