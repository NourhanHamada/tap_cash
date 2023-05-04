import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/styles.dart';

class HomeLowerSection extends StatelessWidget {
  const HomeLowerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FAQs',
              style: MyStyles.textStyle20.copyWith(fontWeight: FontWeight.w600),
            ),
            Text('All', style: MyStyles.textStyle16.copyWith(color: MyColors.grey),)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 185,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors.babyBlue, width: 5)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('How to save electricity?', style: MyStyles.textStyle20,),
                          Image.asset(MyIcons.cord, width: 30,)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: MyColors.mainColor,),
                      ),
                      width: 53,
                      height: 53,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Ask us'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 185,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors.babyBlue, width: 5)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('How to save electricity?', style: MyStyles.textStyle20,),
                          Image.asset(MyIcons.cord, width: 30,)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(color: MyColors.mainColor,),
                      ),
                      width: 53,
                      height: 53,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Ask us'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
