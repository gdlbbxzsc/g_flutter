import 'package:flutter/cupertino.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';
import 'package:g_flutter/widgets/common/dialog/base_dialog.dart';
import 'package:provider/provider.dart';

abstract class BaseListDialog<T> extends BaseDialog<int> {
  @override
  List<Widget> buildView(BuildContext context) {
    return [
      Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: scaleScreen(context, 0.65),
        ),
        child: ChangeNotifierProvider<ListDialogViewModel>.value(
          value: ListDialogViewModel(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    constraints: BoxConstraints(
                      maxHeight: scaleScreen(context, 0.60, useWidth: false),
                    ),
                    child: makeListView(context),
                  ),
                  bottomWidget(context),
                ],
              );
            },
          ),
        ),
      ),
    ];
  }

  ListView makeListView(context);

  Widget bottomWidget(context) {
    return SizedBox();
  }
}

class ListDialogViewModel extends ContentViewModel {
  int index = 0;

  @override
  void initViewModel() {}

  @override
  void destroyViewModel() {}

  void changgeChoose(int index) {
    if (this.index == index) return;
    this.index = index;
    notifyListeners();
  }
  void setChoose(int index) {
    if (this.index == index) return;
    this.index = index;
  }
}
