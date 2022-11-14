import 'package:flutter/material.dart';

class ReddropAppBar extends StatelessWidget {
  bool title, suffix;
  ReddropAppBar({Key? key, this.title = true, this.suffix = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffbbbbbb).withOpacity(0.07),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xff5c5c64),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              suffix ? Image.asset("assets/smiling_figure.png") : Container()
            ],
          ),
          title
              ? Center(
                  child: Text(
                    ".REDDROP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'postnobillscolombobold',
                        color: Colors.white),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
