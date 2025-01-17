import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:math/common/constants/size_constants.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/common/screenutil/screenutil.dart';
import 'package:math/data/mock/paragraph_question.dart';
import 'package:math/data/mock/paragraph_question_constant.dart';
import 'package:math/presentation/controller/multiplication_paragraph_exe_controller.dart';
import 'package:math/presentation/journeys/user_manual/orther_guide.dart';
import 'package:math/presentation/widgets/back_button_widget.dart';
import 'package:math/presentation/widgets/custom_container_widget.dart';
import 'package:math/presentation/widgets/guide_button_widget.dart';
import 'package:math/presentation/widgets/result_screen.dart';
import '../../../../../common/extensions/size_extensions.dart';
import '../../../../themes/theme_text.dart';

class MultiplicationParagraphExeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/ocean.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          color: Colors.black.withOpacity(0.4),
          padding: EdgeInsets.only(
            bottom: Sizes.padding_vertical.h * 2,
            top: ScreenUtil.statusBarHeight,
            left: Sizes.padding_horizontal.w,
            right: Sizes.padding_horizontal.w,
          ),
          child: GetBuilder<MultiplicationParagraphExerciseController>(
            init: MultiplicationParagraphExerciseController(),
            initState: (_) {},
            builder: (_) {
              ParagraphQuestion tmpObj;
              switch (Get.arguments['type']) {
                case 2:
                  tmpObj = ParagraphQuestionConstant
                      .listMul2[_.questionCount.value - 1];
                  break;
                case 3:
                  tmpObj = ParagraphQuestionConstant
                      .listMul3[_.questionCount.value - 1];
                  break;
                case 4:
                  tmpObj = ParagraphQuestionConstant
                      .listMul4[_.questionCount.value - 1];
                  break;
                case 5:
                  tmpObj = ParagraphQuestionConstant
                      .listMul5[_.questionCount.value - 1];
                  break;
                default:
              }
              return Obx(
                () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Giải bài toán có lời văn',
                        style: Theme.of(context).textTheme.whiteSubtitle2,
                      ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.padding_horizontal.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButtonWidget(),
                            Obx(
                              () => CustomContainer(
                                childWidget: Center(
                                  child: Text(
                                    '${_.questionCount.value}/10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .whiteBoldHeadline5,
                                  ),
                                ),
                                outsideHeight: 55,
                                insideHeight: 50,
                                width: Sizes.dimen_100.w,
                                outsideColor: Colors.lightBlue[800],
                                insideColor: Colors.lightBlue[400],
                                borderRadius: 25,
                                onTap: () {},
                              ),
                            ),
                            GuideButtonWidget(onTap: () {
                              Get.to(OtherGuide());
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Sizes.padding_vertical.h * 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 8,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              tmpObj.title,
                              style: Theme.of(context).textTheme.whiteSubtitle1,
                            ),
                            SizedBox(height: Sizes.padding_vertical.h),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                for (var j = 0; j < tmpObj.nums[1]; j++)
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: tmpObj.excep != null
                                        ? Container(
                                            width: ScreenUtil.screenWidth / 2.5,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            padding: EdgeInsets.all(8),
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                for (var i = 0;
                                                    i < tmpObj.nums[0];
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: SvgPicture.asset(
                                                        tmpObj.image,
                                                        height: 35),
                                                  ),
                                              ],
                                            ),
                                          )
                                        : SvgPicture.asset(
                                            tmpObj.image,
                                            height:
                                                tmpObj.nums[1] > 6 ? 50 : 60,
                                          ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Sizes.padding_vertical.h * 2,
                      ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Sizes.padding_horizontal.w,
                          ),
                          buildNumber(_, context, 0),
                          Text(
                            'x',
                            style: Theme.of(context)
                                .textTheme
                                .boldSubtitle1
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                          ),
                          buildNumber(_, context, 1),
                          Text(
                            '=',
                            style: Theme.of(context)
                                .textTheme
                                .boldSubtitle1
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                          ),
                          buildNumber(_, context, 2),
                        ],
                      ),
                      SizedBox(height: Sizes.padding_vertical.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tmpObj.subTitle,
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                          ),
                          buildNumber(_, context, 3),
                          // Text(
                          //   "${tmpObj.unit}",
                          //   style:
                          //       Theme.of(context).textTheme.bodyText2.copyWith(
                          //             fontWeight: FontWeight.normal,
                          //             color: Colors.white,
                          //           ),
                          // ),
                        ],
                      ),
                      SizedBox(height: Sizes.padding_vertical.h * 3),
                      Wrap(
                        children: [
                          for (var i = 0; i < 10; i++)
                            buildSingleKey(i, context, _)
                        ],
                      ),
                      SizedBox(
                        height: Sizes.dimen_12.h,
                      ),
                      CustomContainer(
                        childWidget: Center(
                          child: Text(
                            _.next.value ? 'Tiếp tục' : 'Kiểm tra',
                            style: Theme.of(context)
                                .textTheme
                                .whiteSubtitle1
                                .copyWith(),
                          ),
                        ),
                        outsideHeight: 50,
                        insideHeight: 45,
                        width: Sizes.dimen_140.w,
                        outsideColor: Colors.orange[800],
                        insideColor: Colors.orange[400],
                        borderRadius: 25,
                        onTap: () {
                          _.next.value
                              ? _.questionCount.value == 10
                                  ? Get.off(ResultScreen(
                                      correctAnswers: 10,
                                      score: _.score.value,
                                      showAnswerCount: false,
                                      named: Routers
                                          .multiplicationChoiceParagraphEx,
                                      params: Get.arguments,
                                    ))
                                  : _.generateNewQuestion()
                              : _.checkResult();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding buildNumber(MultiplicationParagraphExerciseController _,
      BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: !_.next.value && _.borderList[index] != 1
            ? () {
                _.inputOnTap(index);
              }
            : null,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _.borderList[index] == 0
                  ? Colors.yellow
                  : (_.borderList[index] == 1
                      ? Colors.lightGreen
                      : (_.borderList[index] == 2
                          ? Colors.red[400]
                          : Colors.white)),
            ),
            child: Center(
              child: Text(
                _.answerList[index] != 0 ? '${_.answerList[index]}' : '',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color:
                          (_.borderList[index] == 1 || _.borderList[index] == 2)
                              ? Colors.white
                              : Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildSingleKey(
    int i,
    BuildContext context,
    MultiplicationParagraphExerciseController _,
  ) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          customBorder: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          highlightColor: Colors.lightBlue,
          onTap: (_.borderList.indexOf(0) != -1 &&
                  _.answerList[_.borderList.indexOf(0)].toString().length < 2)
              ? () {
                  _.keyBoardOnTap(i, _.borderList.indexOf(0));
                }
              : null,
          child: Container(
            width:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 80) /
                    6,
            height:
                (ScreenUtil.screenWidth - Sizes.padding_horizontal.w * 2 - 80) /
                    6,
            child: Center(
              child: Text('$i',
                  style: Theme.of(context).textTheme.boldHeadline5.copyWith()),
            ),
          ),
        ),
      ),
    );
  }
}
