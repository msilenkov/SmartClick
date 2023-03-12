import 'package:flutter/material.dart';
import 'package:smartclick/logic/utility/user_storage.dart';

class UpfieldReg extends StatefulWidget {
  const UpfieldReg({super.key});

  @override
  State<UpfieldReg> createState() => UpfieldRegState();
}

class UpfieldRegState extends State<UpfieldReg> {
  String phoneNumber = '00000000000';

  Future init() async {
    final number = await UserStorage.getUserPhone();

    setState(() {
      phoneNumber = number ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

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
                  child: Text(
                    "*${phoneNumber.substring(phoneNumber.length - 5)}",
                    style: const TextStyle(
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
