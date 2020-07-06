import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:g_flutter/widgets/selecotr/custom_provider.dart';

//这里的方法 需要父子到对应的界面去重新调试一下后使用

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