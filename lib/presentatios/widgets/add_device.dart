import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddDevice extends StatelessWidget {
  const AddDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21, left: 10, right: 10),
      child: SizedBox(
          width: double.infinity,
          child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99)),
              child: ListTile(
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Мой дом",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  leading: SvgPicture.asset('assets/images/Icon=Smart.svg'),
                  trailing: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Добавить устройство",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 193, 77),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ))))),
    );
  }
}
