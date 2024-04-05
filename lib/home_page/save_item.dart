import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class saveItem extends StatelessWidget {
  const saveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(child: Icon(Icons.favorite_border_rounded,color: Colors.white,)),
      );
  }
}
