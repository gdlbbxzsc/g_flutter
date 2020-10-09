import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:g_flutter/base/list/refresh_viewmodel.dart';
import 'package:g_flutter/widgets/provider/common_provider.dart';
import 'package:provider/provider.dart';

class RefreshListView<T> extends StatelessWidget {
  final Widget Function(BuildContext context, int index, T data) itemBuilder;

  const RefreshListView({Key key, this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rootVm = Provider.of<RefreshViewModel>(context, listen: false);
    return SelectorB<RefreshViewModel>(
      builder: (context, top, child) {
        return SelectorB<RefreshViewModel>(
          builder: (context, bottom, child) {
            return SelectorI<RefreshViewModel>(
              builder: (c, change, _) {
                return SelectorL<RefreshViewModel, T>(
                  builder: (context, data, child) {
                    return EasyRefresh(
                      controller: rootVm.controller,
                      enableControlFinishLoad: true,
                      enableControlFinishRefresh: true,
                      topBouncing: top,
                      bottomBouncing: bottom,
                      header: ClassicalHeader(infoColor: Colors.grey),
                      footer: ClassicalFooter(infoColor: Colors.grey),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 16);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return itemBuilder(context, index, data[index]);
                        },
                        itemCount: data.length,
                        shrinkWrap: true,
                      ),
                      onRefresh: top
                          ? () async {
                              await Future.delayed(Duration(seconds: 1), () {
                                rootVm.loadDatasFst();
                              });
                            }
                          : null,
                      onLoad: bottom
                          ? () async {
                              await Future.delayed(Duration(seconds: 1), () {
                                rootVm.loadDatasNxt();
                              });
                            }
                          : null,
                    );
                  },
                  selector: (buildContext, vm) => vm.dataList,
                );
              },
              selector: (c, vm) => vm.dataChangeCount,
            );
          },
          selector: (buildContext, vm) => vm.bottomBouncing,
        );
      },
      selector: (buildContext, vm) => vm.topBouncing,
    );
  }
}
