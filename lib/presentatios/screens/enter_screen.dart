import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartclick/logic/cubits/auth/auth_cubit.dart';
import 'package:smartclick/presentatios/widgets/info_card.dart';
import 'package:smartclick/presentatios/widgets/add_device.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:smartclick/presentatios/widgets/up_field.dart';
import 'package:smartclick/presentatios/widgets/up_field_reg.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 57, left: 18, right: 22),
                //* Ряд верхних кнопок
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.autorized == false) {
                      return const UpField();
                    } else {
                      return const UpFieldReg();
                    }
                  },
                )),
            //* Блок с Текстом
            SizedBox(
              width: 178,
              child: Wrap(alignment: WrapAlignment.center, children: const [
                AutoSizeText(
                  "Умный дом",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                AutoSizeText(
                  "Интернет и тв",
                  maxLines: 1,
                  style: TextStyle(
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
                  children: const [
                    //* Умный дом
                    SizedBox(
                        width: double.infinity,
                        height: 252,
                        child: InfoCard(
                            title: "Умный дом",
                            assetPath: 'assets/images/Icon=Smart.svg',
                            companyName: "MOiO",
                            mainText:
                                "Используйте современные технологии автоматизации квартиры или загородного дома от российских разработчиков.",
                            mxl: 3,
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
                                "Подключайте высокоскоростной интернет и телевидение для дома и бизнеса.",
                            mxl: 2,
                            leftButtonText: "Тест скорости")),
                  ],
                ),
              ),
            ),
            //* Нижний элемент Card
            const AddDevice(),
          ],
        ));
  }
}
