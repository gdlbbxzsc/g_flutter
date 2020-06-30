import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:g_flutter/base/base_mvvm.dart';
import 'package:g_flutter/pages/list/viewmodel.dart';
import 'package:g_flutter/widgets/common/app_bars.dart';
import 'package:g_flutter/widgets/common/lines.dart';
import 'package:g_flutter/widgets/common/texts.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListPageWidget extends MultiProviderBaseWidget {
  @override
  List<SingleChildWidget> createProviders(BuildContext context) {
    return [
      ChangeNotifierProvider<ListViewModel>(create: (_) {
        return ListViewModel(context: context);
      }),
//      ChangeNotifierProxyProvider<InComeViewModel,
//          MyIncomeEntityDataUserCenterInfo>(
//        create: (_) {
//          return null;
//        },
//        update: (context, value, previous) {
//          if (value == null) return null;
//          return value.userCenterInfo;
//        },
//      ),
    ];
  }

  @override
  Widget buildView(BuildContext context) {
    ListViewModel viewModel = getViewModel<ListViewModel>(context);
    return Scaffold(
      appBar: CommonAppBar.backBlack("列表"),
      body: Selector<ListViewModel, List<String>>(
        builder: (context, data, child) => EasyRefresh(
          controller: viewModel.controller,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          header: ClassicalHeader(
            infoColor: Colors.grey,
          ),
          footer: ClassicalFooter(
            infoColor: Colors.grey,
          ),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Line();
            },
            itemBuilder: (BuildContext context, int index) {
              return _item(data[index]);
            },
            itemCount: data.length,
            shrinkWrap: true,
          ),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1), () {
              viewModel.loadDatasFst();
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 1), () {
              viewModel.loadDatasNxt();
            });
          },
        ),
        selector: (_, vm) {
          return vm.dataList;
        },
      ),
    );
  }

  Widget _item(String data) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CommonText.black16("$data"),
        ],
      ),
    );
  }
}
