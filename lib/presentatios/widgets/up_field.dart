import 'package:flutter/material.dart';
import 'package:smartclick/presentatios/screens/registration_screen.dart';

class UpField extends StatelessWidget {
  const UpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 17)),
                    minimumSize: MaterialStateProperty.all(const Size(56, 38)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))))),
                onPressed: null,
                child: const Icon(
                  Icons.expand_more,
                  // color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF00C14D)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 15)),
                    minimumSize: MaterialStateProperty.all(const Size(0, 38)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                },
                child: const Text(
                  'Привязать номер',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 17)),
                minimumSize: MaterialStateProperty.all(const Size(56, 38)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))))),
            onPressed: null,
            child: const Icon(
              Icons.more_horiz,
              // color: Colors.black,
            )),
      ],
    );
  }
}
