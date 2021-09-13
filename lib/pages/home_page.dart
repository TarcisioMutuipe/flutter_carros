import 'package:carros/dto/carro.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carros/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'carros_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _preference(_tabController);
  }

  void _preference( _tabController) async {
    var prefs = await SharedPreferences.getInstance();

    int tabIdx = prefs.getInt("tabIdx")!;

    setState(() {
      _tabController.index = tabIdx;
    });
    print("Tab ${_tabController.index}");

    _tabController.addListener(() {
      prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //  length: 3,
    //child:
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Carros"),
          bottom:
          _tabController == null ? null :
          TabBar(controller: _tabController, tabs: [
            Tab(text: "Clássicos"),
            Tab(text: "Esportivos"),
            Tab(text: "Luxo"),
          ])),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosListView(TipoCarro.classicos),
          Container(
              color: Colors.blue, child: CarrosListView(TipoCarro.esportivos)),
          Container(color: Colors.red, child: CarrosListView(TipoCarro.luxo)),
        ],
      ),
      drawer: DrawerList(),
      // ),
    );
  }
}
