import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String assetPath;
  final String companyName;
  final String mainText;
  final String leftButtonText;

  const InfoCard(
      {super.key,
      required this.title,
      required this.assetPath,
      required this.companyName,
      required this.mainText,
      required this.leftButtonText});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 36),
        //* Общий лемент
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //* Элемент с кнопками
            SizedBox(
              width: double.infinity,
              height: 108,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            SvgPicture.asset(assetPath),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(title,
                                  style: const TextStyle(
                                      fontFamily: "SF Pro Rounded",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                      Text(companyName,
                          style: const TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              fontWeight: FontWeight.w500,
                              fontSize: 20))
                    ],
                  ),
                  Text(mainText,
                      style: const TextStyle(
                          fontFamily: "SF Pro Rounded",
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ],
              ),

              //* Элемент с кнопками
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Левая кнопка
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(leftButtonText,
                          style: TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFEEEEEE)),
                          fixedSize:
                              MaterialStateProperty.all(const Size(150, 74)),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)))))),
                  //* Правая кнопка
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Подключить",
                          style: TextStyle(
                              fontFamily: "SF Pro Rounded",
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF00C14D)),
                          fixedSize:
                              MaterialStateProperty.all(const Size(150, 74)),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)))))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
