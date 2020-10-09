import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:g_flutter/widgets/provider/common_provider.dart';

//这里的方法 需要父子到对应的界面去重新调试一下后使用
//轮播图
//同意 xxx协议 点击打开去哪里
//---------------------------------------------------------------------
//轮播图
Widget _createSwiper() {
  return Container(
    width: double.infinity,
    height: 150,
    child: SelectorM<String, List<String>>(
      builder: (context, data, child) => (data == null || data.isEmpty)
          ? Center()
          : Swiper(
              // 自动翻页
              autoplay: true,
              scrollDirection: Axis.horizontal,
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) =>
                  Image.network("a url", fit: BoxFit.fill),
              onTap: (index) => print('点击了第$index'),
              pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  builder: DotSwiperPaginationBuilder(
                      //间隔
                      space: 3,
                      size: 8,
                      color: Colors.black54,
                      activeSize: 8,
                      activeColor: Colors.grey)),
              // scale: 0.95, // 两张图片之间的间隔
            ),
      selector: (content, vm) => vm,
    ),
  );
}

//同意 xxx协议 点击打开去哪里
Widget _agree() {
 return Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
     SelectorB<NewRechargeViewModel>(
         selector: (buildContext, vm) => vm.check,
         builder: (context, data, child) {
           return Checkbox(
             value: data,
             activeColor: Colors.red,
             onChanged: (bool val) {
               viewModel<NewRechargeViewModel>(context).changeCheck();
             },
           );
         }),
     CommonText.black15("已阅读并同意"),
     InkWell(
       onTap: () {
         HtmlHelper.getInstance()
             .openHtmlPage(Constant.RECHARGE_PROTOCOL_URL);
       },
       child: CommonText.red15("《淘差事VIP购买协议》"),
     ),
   ],
 );
}
//viewmodel 中用到的字段方法
bool check = false;
void changeCheck() {
 check = !check;
 notifyListeners();
}




class _RadioWidget extends StatelessWidget {
  final String title;
  final int value;
  final Function() onTap;

  const _RadioWidget({Key key, this.title, this.onTap, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: SelectorI<CarMngAddViewModel>(
            builder: (c, data, _) {
              return Radio<int>(
                value: value,
                groupValue: data,
                onChanged: (value) {
                  onTap();
                },
              );
            },
            selector: (c, vm) {
              return vm.carCardType;
            },
          ),
        ),
        SizedBox(width: 3),
        InkWell(
          child: CommonText.black16(title),
          onTap: onTap,
        ),
      ],
    );
  }
}
