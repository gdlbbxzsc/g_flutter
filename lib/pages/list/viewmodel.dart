import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:g_flutter/base/base_mvvm.dart';

import 'model.dart';

class ListViewModel extends BaseViewModel {
  final ListModel _model = ListModel();

  final EasyRefreshController controller = EasyRefreshController();

  final int pageSize = 50;
  int page_num = 1;

  List<String> dataList = List();

  ListViewModel({context}) : super(context: context);

  @override
  void initViewModel() {
    loadDatasFst();
  }

  @override
  void destroyViewModel() {}

  void loadDatasFst() {
    _loadDatas(page_num = 1);
  }

  void loadDatasNxt() {
    _loadDatas(page_num);
  }

  void _loadDatas(int page) {
    if (this.page_num != page) return;

    if (page == -1) {
      //=-1：代表没有更多数据了。所以 只能刷新不能加载
      controller.finishRefresh(success: true);
      controller.finishLoad(success: true, noMore: true);
      notifyListeners();
      return;
    }

    if (page == 1) {
      //=1or=0：代表第一次加载，所以 只能刷新不能加载
      controller.finishRefresh(success: true);
      controller.finishLoad(success: true, noMore: true);
    }
//    _model.newUserCapitalBill<String>(page, pageSize, (t) {
//      if (this.page_num != page) return;
//
//      if (page == 1) {
//        dataList.clear();
//      }
//      print("=====>${t.data?.billList?.length}");
//      List list = t.data.billList;
//
//      if (list == null || list.isEmpty || list.length < pageSize) {
//        page_num = -1;
//        controller.finishRefresh(success: true);
//        controller.finishLoad(success: true, noMore: true);
//      } else {
//        page_num += 1;
//        controller.finishRefresh(success: true);
//        controller.finishLoad(success: true, noMore: false);
//      }
//      if (list == null) list = new List();
//
//      for (int i = dataList.length - 1; i >= 0; i--) {
//        list.insert(0, dataList[i]);
//      }
//      dataList = list;
//
//      notifyListeners();
//    });
  }
}
