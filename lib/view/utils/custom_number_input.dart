import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';

class CustomNumbersInput extends StatefulWidget {
  const CustomNumbersInput({Key? key}) : super(key: key);

  @override
  State<CustomNumbersInput> createState() => _CustomNumbersInputState();
}

class _CustomNumbersInputState extends State<CustomNumbersInput> {
  List<int> number = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];
  int zero = 0;
  List<String> result = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 40,
          mainAxisExtent: 90,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return index == 9
              ? Text(
                  'Forget?',
                  textAlign: TextAlign.center,
                  style: MyStyles.textStyle10.copyWith(
                    color: MyColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : index == 10
                  ? GestureDetector(
                      onTap: () {
                        // print(zero.toString());
                        result.add(zero.toString());
                      },
                      child: Text(
                        zero.toString(),
                        textAlign: TextAlign.center,
                        style: MyStyles.textStyle20.copyWith(
                          color: MyColors.mainColor,
                        ),
                      ),
                    )
                  : index == 11
                      ? SvgPicture.asset(
                          'assets/icons/finger_print1.svg',
                          width: 32,
                          height: 32,
                        )
                      // Image.asset(
                      //                 MyIcons.fingerPrint,
                      //               )
                      : GestureDetector(
                          onTap: () {
                            // print(number[index]);
                            result.add([number[index]].toString());
                            print(result.join());
                          },
                          child: Text(
                            number[index].toString(),
                            textAlign: TextAlign.center,
                            style: MyStyles.textStyle20.copyWith(
                              color: MyColors.mainColor,
                            ),
                          ),
                        );
        },
      ),
    );
  }
}
