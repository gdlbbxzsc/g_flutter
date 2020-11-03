import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/dialog/base_list_dialog.dart';
import 'package:g_flutter/widgets/provider/common_provider.dart';
import 'package:provider/provider.dart';

class SingleChooseListDialog<T> extends BaseListDialog<int> {
  final List<T> dataList;
  final Widget Function(T data, int index) onCreateItem;
  final void Function(T data, int index) onChoose;

  SingleChooseListDialog(this.dataList, this.onCreateItem, this.onChoose);

  @override
  ListView makeListView(context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 9);
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 18,
                height: 18,
                child: SelectorI<ListDialogViewModel>(
                  builder: (c, data, _) {
                    return Radio<int>(
                      value: index,
                      groupValue: data,
                      onChanged: (value) {
                        Provider.of<ListDialogViewModel>(context, listen: false)
                            .changgeChoose(index);
                      },
                    );
                  },
                  selector: (c, vm) {
                    return vm.index;
                  },
                ),
              ),
              SizedBox(width: 3),
              onCreateItem(dataList[index], index),
            ],
          ),
          onTap: () {
            Provider.of<ListDialogViewModel>(context, listen: false)
                .changgeChoose(index);
          },
        );
      },
      itemCount: dataList.length,
    );
  }

  @override
  Widget bottomWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MyButton.forMyDialog(
        text: "选择",
        onTap: () {
          var res =
              Provider.of<ListDialogViewModel>(context, listen: false).index;
          pop(context, res);
        },
      ),
    );
  }

  @override
  void doThen(int res) {
    onChoose(dataList[res], res);
  }
}
