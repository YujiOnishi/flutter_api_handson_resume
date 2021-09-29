import 'package:flutter/material.dart';
import '../widget/drawerMenu.dart';
import '../http/HouseholdAccountDataHttp.dart';
import '../entity/HouseholdAccountData.dart';
import './input.dart';

class HouseholdAccountBookList extends StatelessWidget {
  final List<Tab> _tabs = <Tab>[
    Tab(text: '総合'),
    Tab(text: '収入'),
    Tab(text: '支出'),
  ];

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => HouseholdAccountBookList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<List<HouseholdAccountData>> householdAccountDataList = HouseholdAccountDataHttp.getHouseholdAccountDataList();

    return FutureBuilder<List<HouseholdAccountData>>(
      future: householdAccountDataList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DefaultTabController(
            length: _tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("家計簿一覧"),
                bottom: TabBar(
                  tabs: _tabs,
                ),
              ),
              drawer: DrawerMenu(),
              body: TabBarView(
                children: _tabs.map(
                      (Tab tab) {
                    return SingleChildScrollView(
                      child: Text(tab.text),
                    );
                  },
                ).toList(),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  //_onPressAddButton(context);
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('error');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
