import 'package:flutter/material.dart';
import 'package:reddrop/presentation/styles.dart';

Container ChatBubble(BuildContext context,
    {required int id, required Widget widget}) {
  return (id == 1)
      ? Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xff272c39),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: widget),
          ),
        )
      : Container(
          padding: EdgeInsets.only(right: 20),
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xff636467),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: widget),
          ),
        );
}
