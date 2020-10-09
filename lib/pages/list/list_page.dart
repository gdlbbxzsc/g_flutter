import 'package:flutter/material.dart';
import 'package:g_flutter/base/list/refresh_viewmodel.dart';
import 'package:g_flutter/base/mvvm/view.dart';
import 'package:g_flutter/pages/list/viewmodel.dart';
import 'package:g_flutter/widgets/common/texts.dart';
import 'package:g_flutter/widgets/custom/refresh_listview.dart';
import 'package:g_flutter/widgets/provider/common_provider.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ListPageWidget extends AppBarMultiProviderWidget {
  @override
  String title() {
    return "列表1";
  }

  @override
  List<SingleChildWidget> createProviders(BuildContext context) {
    return [
      ChangeNotifierProvider<ListViewModel>(create: (context) {
        return ListViewModel(context: context);
      }),
      MyChangeNotifierProxyProvider<ListViewModel, RefreshViewModel>(
          update: (context, value, previous) {
        return value.refreshViewModel;
      }),
    ];
  }

  @override
  Widget buildViewBody(BuildContext context) {
    return _list();
  }

  Widget _list() {
    return RefreshListView(itemBuilder: (context, index, data) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            MyText.black16("$index===$data"),
          ],
        ),
      );
    });
  }
// Widget _list() {
//   return Consumer<RefreshViewModel>(
//     builder: (context, value, child) {
//       return EasyRefresh(
//         controller: value.controller,
//         enableControlFinishLoad: true,
//         enableControlFinishRefresh: true,
//         topBouncing: value.topBouncing,
//         bottomBouncing: value.bottomBouncing,
//         header: ClassicalHeader(
//           infoColor: Colors.grey,
//         ),
//         footer: ClassicalFooter(
//           infoColor: Colors.grey,
//         ),
//         child: ListView.separated(
//           separatorBuilder: (BuildContext context, int index) {
//             return Line();
//           },
//           itemBuilder: (BuildContext context, int index) {
//             return _item(value.dataList[index]);
//           },
//           itemCount: value.dataList.length,
//           shrinkWrap: true,
//         ),
//         onRefresh: value.topBouncing
//             ? () async {
//           value.loadDatasFst();
//         }
//             : null,
//         onLoad: value.bottomBouncing
//             ? () async {
//           value.loadDatasNxt();
//         }
//             : null,
//       );
//     },
//   );
// }
//
// Widget _item(String data) {
//   return Padding(
//     padding: const EdgeInsets.all(12),
//     child: Row(
//       children: [
//         MyText.black16("$data"),
//       ],
//     ),
//   );
// }
}
