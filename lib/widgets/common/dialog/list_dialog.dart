import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/dialog/base_list_dialog.dart';

class ListDialog<T> extends BaseListDialog<int> {
  final List<T> dataList;
  final Widget Function(T data, int index) onCreateItem;
  final void Function(T data, int index) onItemClick;

  ListDialog(this.dataList, this.onCreateItem, this.onItemClick);

  @override
  ListView makeListView(context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 9);
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: onCreateItem(dataList[index], index),
          onTap: () {
            pop(context, index);
          },
        );
      },
      itemCount: dataList.length,
    );
  }

  @override
  void doThen(int res) {
    onItemClick(dataList[res], res);
  }
}
