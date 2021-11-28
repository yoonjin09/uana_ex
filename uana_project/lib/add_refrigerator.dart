import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'add_refrigerator_detail.dart';
import 'login_provider.dart';
import 'refrigerator_provider.dart';
import 'dart:core';

class AddRefrigeratorPage extends StatefulWidget {
  const AddRefrigeratorPage ({Key? key}) : super(key: key);

  @override
  _AddRefrigeratorPageState createState() => _AddRefrigeratorPageState();
}
/*
자신의 냉장고에 물품 추가하는 페이지
 */
class _AddRefrigeratorPageState extends State<AddRefrigeratorPage> {
  @override
  Widget build(BuildContext context) {
    RefrigeratorProvider refrigeratorProvider = Provider.of(context, listen: true); // Refrigerator Provider 사용
    return Scaffold(
      appBar: AppBar(
        title: Text('식재료 등록'),
      ),


      body: Column(
        children: [
          Expanded(
            child: GridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 5,
            padding: const EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: refrigeratorProvider.foodInformation.map((FoodInfo food) { // 전체 식재료 항목들 버튼화 해서 화면에 띄움
              return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRefrigeratorDetailPage(food: food), // 해당 식재료 add detail로 넘어감
                      ),
                    );
                  },
                  child: Text(food.foodName)
              );
            }).toList(),
          ),
        ),
      ],
    ),
    );
  }
}