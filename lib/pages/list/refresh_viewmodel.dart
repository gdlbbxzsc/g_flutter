import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';

class RefreshViewModel<T extends Object> extends BaseViewModel {
  final EasyRefreshController controller = EasyRefreshController();
  bool topBouncing = true;
  bool bottomBouncing = false;
  List<T> dataList = List();

  final int pageSize = 50;

  int _page_num = 1;

  final Future<List<T>> Function() onloadDatas;

  RefreshViewModel(this.onloadDatas) : super();

  @override
  void initViewModel() {
    loadDatasFst();
  }

  @override
  void destroyViewModel() {
    controller.dispose();
  }

  void loadDatasFst() {
    _loadDatas(_page_num = 1);
  }

  void loadDatasNxt() {
    _loadDatas(_page_num);
  }

  void _loadDatas(int page) {
    if (!beforeLoadDatas(page)) return;

    onloadDatas().then((value) {
      afterLoadDatasSucc(page, value);
    });
  }

  bool beforeLoadDatas(int page) {
    if (this._page_num != page) return false;

    if (page == -1) {
      //=-1：代表没有更多数据了。所以 只能刷新不能加载
      topBouncing = true;
      bottomBouncing = false;
      controller.finishRefresh(success: true);
      controller.finishLoad(success: true);
      notifyListeners();
      return false;
    }

    if (page == 1) {
      //=1or=0：代表第一次加载，所以 只能刷新不能加载
      topBouncing = true;
      bottomBouncing = false;
      notifyListeners();
    }
    return true;
  }

  void afterLoadDatasSucc(int page, List<T> tempList) {
    if (this._page_num != page) return;

    if (page == 1) {
      dataList.clear();
    }
    List<T> list = tempList;

    if (list == null || list.isEmpty || list.length < pageSize) {
      _page_num = -1;
      topBouncing = true;
      bottomBouncing = false;
    } else {
      _page_num += 1;
      topBouncing = true;
      bottomBouncing = true;
    }
    if (list == null) list = new List();

    for (int i = dataList.length - 1; i >= 0; i--) {
      list.insert(0, dataList[i]);
    }
    dataList = list;

    controller.finishRefresh(success: true);
    controller.finishLoad(success: true);
    notifyListeners();
  }
}
