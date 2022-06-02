import 'package:flutter/material.dart';
import 'package:gsl_flutter_app/constant/Constant.dart';
import 'package:gsl_flutter_app/widgets/common/lines.dart';
import 'package:gsl_flutter_app/widgets/common/texts.dart';

class StepsWidget extends StatefulWidget {
  const StepsWidget({Key key, this.currentIndex}) : super(key: key);
  final int currentIndex;

  @override
  _StepsWidgetState createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  var _items = ["申请入会", "阅读协议", "填写信息", "审核入会"];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Constant.getImagePath('mine_head_bg.webp')))),
      alignment: Alignment.center,
      width: double.infinity,
      child: Row(
        children: _items
            .asMap()
            .entries
            .map((item) => Expanded(
                  child: _ItemWidget(
                      index: item.key,
                      currentIndex: widget.currentIndex,
                      text: item.value,
                      max: _items.length),
                ))
            .toList(),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final int index;
  final String text;
  final int max;
  int currentIndex = 0;

  _ItemWidget({Key key, this.index, this.currentIndex, this.text, this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: index == 0 ? 0 : 1,
                child: Line(
                    color: index <= currentIndex ? Colors.white : Colors.grey),
              ),
            ),
            index < currentIndex
                ? Point0Widget(
                    index: index,
                    currentIndex: currentIndex,
                    text: text,
                    max: max)
                : index <= currentIndex
                    ? Point1Widget(
                        index: index,
                        currentIndex: currentIndex,
                        text: text,
                        max: max)
                    : Point2Widget(
                        index: index,
                        currentIndex: currentIndex,
                        text: text,
                        max: max),
            Expanded(
              child: Opacity(
                opacity: max - 1 == index ? 0 : 1,
                child: Line(
                    color: index < currentIndex ? Colors.white : Colors.grey),
              ),
            )
          ],
        ),
        SizedBox(height: 4),
        SizedBox(
            child: index <= currentIndex
                ? CommonText.white13(text)
                : CommonText.grey13(text)),
      ],
    );
  }
}

class Point0Widget extends StatelessWidget {
  final int index;
  final String text;
  final int max;
  int currentIndex = 0;

  Point0Widget({Key key, this.index, this.text, this.max, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                  child: Opacity(
                      opacity: index == 0 ? 0 : 1,
                      child: Line(color: Colors.white))),
              Expanded(
                  child: Opacity(
                      opacity: max - 1 == index ? 0 : 1,
                      child: Line(color: Colors.white)))
            ],
          ),
        ),
        Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: new Border.all(width: 0.5, color: Colors.white),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              Constant.getImagePath('right.png'),
              width: 15,
              height: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class Point1Widget extends StatelessWidget {
  final int index;
  final String text;
  final int max;
  int currentIndex = 0;

  Point1Widget({Key key, this.index, this.text, this.max, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                  child: Opacity(
                      opacity: index == 0 ? 0 : 1,
                      child: Line(color: Colors.white))),
              Expanded(
                  child: Opacity(
                      opacity: max - 1 == index ? 0 : 1,
                      child: Line(color: Colors.white)))
            ],
          ),
        ),
        Container(
          width: 24,
          height: 24,
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: new Border.all(width: 0.5, color: Colors.white),
          ),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: CommonText.blue14Bold((index + 1).toString())),
        ),
      ],
    );
  }
}

class Point2Widget extends StatelessWidget {
  final int index;
  final String text;
  final int max;
  int currentIndex = 0;

  Point2Widget({Key key, this.index, this.text, this.max, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(
                  child: Opacity(
                      opacity: index == 0 ? 0 : 1,
                      child: Line(color: Colors.grey))),
              Expanded(
                  child: Opacity(
                      opacity: max - 1 == index ? 0 : 1,
                      child: Line(color: Colors.grey)))
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 24,
          height: 24,
          child: Container(
            width: 12,
            height: 12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
