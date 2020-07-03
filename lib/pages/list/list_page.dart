import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:g_flutter/base/base_mvvm.dart';
import 'package:g_flutter/pages/list/refresh_viewmodel.dart';
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
      ChangeNotifierProxyProvider<ListViewModel, RefreshViewModel>(
        create: (_) {
          return null;
        },
        update: (context, value, previous) {
          if (value == null) return null;
          return value.refreshViewModel;
        },
      ),
    ];
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.backBlack("列表"),
      body: _list(),
    );
  }

  Widget _list() {
    return Consumer<RefreshViewModel>(
      builder: (context, value, child) {
        return EasyRefresh(
          controller: value.controller,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          topBouncing: value.topBouncing,
          bottomBouncing: value.bottomBouncing,
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
              return _item(value.dataList[index]);
            },
            itemCount: value.dataList.length,
            shrinkWrap: true,
          ),
          onRefresh: value.topBouncing
              ? () async {
                  value.loadDatasFst();
                }
              : null,
          onLoad: value.bottomBouncing
              ? () async {
                  value.loadDatasNxt();
                }
              : null,
        );
      },
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
