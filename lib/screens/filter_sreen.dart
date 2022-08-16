import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function savedFilters;
  Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters,this.savedFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['vegetarian'];
  }

  Widget buildSwithchListTiles(String title, bool currentValue,
      String discription, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(discription),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters= {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian
            };
            widget.savedFilters(selectedFilters);
          }, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust you meal selection.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwithchListTiles("Gluten-Free", _glutenFree,
                    "Only include gluten free meals.", (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwithchListTiles(
                    "Vegetarian", _vegetarian, "Only include vegetarian meals.",
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwithchListTiles("Lactose-Free", _lactoseFree,
                    "Only include lactose free meals.", (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                }),
                buildSwithchListTiles("Vegan", _vegan,
                    "Only include vegan meals.", (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
