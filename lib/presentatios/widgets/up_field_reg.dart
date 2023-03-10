import 'package:flutter/material.dart';

class UpFieldReg extends StatelessWidget {
  const UpFieldReg({super.key});

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
                onPressed: () {},
                child: const Icon(
                  Icons.expand_more,
                  // color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 17)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(56, 38)),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))))),
                  onPressed: () {},
                  child: const Text(
                    '*6490',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )),
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
            onPressed: () {},
            child: const Icon(
              Icons.more_horiz,
              // color: Colors.black,
            )),
      ],
    );
  }
}
