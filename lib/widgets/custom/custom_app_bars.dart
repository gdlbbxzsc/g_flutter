import 'package:flutter/material.dart';

//自定义标题栏
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: MediaQuery.of(context).size.width,
      height: 88,
      child: ClipRRect(
        child: Container(
          color: Colors.blueAccent,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "LOGO",
                    style: TextStyle(color: Colors.white),
                  ),
                  margin: EdgeInsets.only(top: 20.0, bottom: 15.0, right: 10.0),
                  width: 120,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
//                          borderRadius:
                          ),
                      child: Opacity(
                        opacity: 0.8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "商品名、厂家、条形码",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  width: 50,
                  child: Icon(Icons.message, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size(double.infinity, 88);
}
