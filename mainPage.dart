import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:pluto_grid/pluto_grid.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> sizeAnimation;
  int numData;
  var a, b, c, d, e, f;
  String textValueInput = '';
  bool hide = false;
  bool openclosehide = false;
  bool openclose1hide = false;
  bool iconButtomHide = true;
  bool dialogSetValueHide = false;
  double width;
  double height;
  int currentState = 0;
  Offset position = Offset(300.0, 300.0);
  List<MaterialColor> colorslider = [for (int i = 0; i < 18; i++) Colors.green];
  int x, dx, dy, y, zoom, _zoom;
  TextEditingController _a_1 = new TextEditingController();
  List<double> _dataTPS1 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  List<String> myDataList = List<String>(100);
  String data_1 = '0.0';
  List<String> _headcolumn = ['', '900', '1100', '1300', '1500', '1700', '1900', '2100', '2300', '2500', '2700', '2900', '3100', '3300', '3500', '3700', '3900', '4100', '4300'];
  List<double> _selectedValues = List();
  List<bool> checkSelect = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  // bool checkSelect = false;
  test() {
    print(a);
    print(b);
    print(c);
    print(d);
    print(e);
  }

  _inputValue(int numValue) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text('Input Your Value'),
              content: new TextField(
                controller: _a_1,
                decoration: new InputDecoration(hintText: "Enter your value : 252.00"),
                maxLength: 8,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // Only numbers can be entered
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Save"),
                  onPressed: () {
                    setState(() {
                      data_1 = _a_1.text;
                      myDataList[numValue] = _a_1.text;
                      print(_a_1.text);
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  void _onItemCheckedChange(itemValue, checkSelect) {
    setState(() {
      if (checkSelect) {
        _selectedValues.add(itemValue);
        print(_selectedValues.length);
      } else {
        _selectedValues.remove(itemValue);
        print(_selectedValues.length);
      }
    });
  }

  _dialogsetValue() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text('Input Your Value'),
              content: new TextField(
                controller: _a_1,
                decoration: new InputDecoration(hintText: "Enter your value : 252.00"),
                maxLength: 8,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // Only numbers can be entered
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Save"),
                  onPressed: () {
                    setState(() {
                      print(_a_1.text);
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  List<PlutoColumn> columns = [
    PlutoColumn(
      title: '',
      field: 'Tps_field',
      width: 140,
      type: PlutoColumnType.text(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '900',
      field: 'tps900_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1000',
      field: 'tps1000_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1100',
      field: 'tps1100_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1200',
      field: 'tps1200_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1300',
      field: 'tps1300_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1400',
      field: 'tps1400_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1500',
      field: 'tps1500_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1600',
      field: 'tps1600_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1700',
      field: 'tps1700_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1800',
      field: 'tps1800_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '1900',
      field: 'tps1900_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2000',
      field: 'tps2000_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2100',
      field: 'tps2100_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2200',
      field: 'tps2200_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2300',
      field: 'tps2300_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2400',
      field: 'tps2400_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2500',
      field: 'tps2500_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2600',
      field: 'tps2600_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2700',
      field: 'tps2700_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2800',
      field: 'tps2800_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '2900',
      field: 'tps2900_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3000',
      field: 'tps3000_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3100',
      field: 'tps3100_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3200',
      field: 'tps3200_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3300',
      field: 'tps3300_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3400',
      field: 'tps3400_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3500',
      field: 'tps3500_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3600',
      field: 'tps3600_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3700',
      field: 'tps3700_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3800',
      field: 'tps3800_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '3900',
      field: 'tps3900_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4000',
      field: 'tps4000_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4100',
      field: 'tps4100_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4200',
      field: 'tps4200_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4300',
      field: 'tps4300_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4400',
      field: 'tps4400_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4500',
      field: 'tps4500_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
    PlutoColumn(
      title: '4600',
      field: 'tps4600_field',
      width: 55,
      type: PlutoColumnType.number(readOnly: true),
      enableDraggable: false,
      enableSorting: false,
      enableContextMenu: false,
    ),
  ];

  List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 1'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 2'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 3'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 4'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 5'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    PlutoRow(
      cells: {
        'Tps_field': PlutoCell(value: 'TPS 6'),
        'tps900_field': PlutoCell(value: 0),
        'tps1000_field': PlutoCell(value: 0),
        'tps1100_field': PlutoCell(value: 0),
        'tps1200_field': PlutoCell(value: 0),
        'tps1300_field': PlutoCell(value: 0),
        'tps1400_field': PlutoCell(value: 0),
        'tps1500_field': PlutoCell(value: 0),
        'tps1600_field': PlutoCell(value: 0),
        'tps1700_field': PlutoCell(value: 0),
        'tps1800_field': PlutoCell(value: 0),
        'tps1900_field': PlutoCell(value: 0),
        'tps2000_field': PlutoCell(value: 0),
        'tps2100_field': PlutoCell(value: 0),
        'tps2200_field': PlutoCell(value: 0),
        'tps2300_field': PlutoCell(value: 0),
        'tps2400_field': PlutoCell(value: 0),
        'tps2500_field': PlutoCell(value: 0),
        'tps2600_field': PlutoCell(value: 0),
        'tps2700_field': PlutoCell(value: 0),
        'tps2800_field': PlutoCell(value: 0),
        'tps2900_field': PlutoCell(value: 0),
        'tps3000_field': PlutoCell(value: 0),
        'tps3100_field': PlutoCell(value: 0),
        'tps3200_field': PlutoCell(value: 0),
        'tps3300_field': PlutoCell(value: 0),
        'tps3400_field': PlutoCell(value: 0),
        'tps3500_field': PlutoCell(value: 0),
        'tps3600_field': PlutoCell(value: 0),
        'tps3700_field': PlutoCell(value: 0),
        'tps3800_field': PlutoCell(value: 0),
        'tps3900_field': PlutoCell(value: 0),
        'tps4000_field': PlutoCell(value: 0),
        'tps4100_field': PlutoCell(value: 0),
        'tps4200_field': PlutoCell(value: 0),
        'tps4300_field': PlutoCell(value: 0),
        'tps4400_field': PlutoCell(value: 0),
        'tps4500_field': PlutoCell(value: 0),
        'tps4600_field': PlutoCell(value: 0),
      },
    ),
    
  ];
  void inputValue(numData) {
    print('test');

    rows[0].cells['tps900_field'].value = numData;
    numData = null;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 0, end: 60).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    sizeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    rows[0].cells['tps900_field'].value = 0;
    rows[0].cells['tps1000_field'].value = 10;
    rows[0].cells['tps1100_field'].value = 20;
    rows[0].cells['tps1200_field'].value = 30;
    rows[0].cells['tps1300_field'].value = 40;
    rows[0].cells['tps1400_field'].value = 50;
    rows[0].cells['tps1500_field'].value = 60;
    rows[0].cells['tps1600_field'].value = 70;
    rows[0].cells['tps1700_field'].value = 80;
    rows[0].cells['tps1800_field'].value = 90;
    rows[0].cells['tps1900_field'].value = 100;
    
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/DinoBG.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Zoom(
                width: 2400,
                height: 5165,
                canvasColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                colorScrollBars: Colors.red,
                opacityScrollBars: 0.9,
                scrollWeight: 10.0,
                centerOnScale: true,
                enableScroll: true,
                doubleTapZoom: true,
                zoomSensibility: 3,
                initZoom: 0.25,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 4665,
                        width: 2250,
                        padding: const EdgeInsets.all(5),
                        child: PlutoGrid(
                          configuration: PlutoConfiguration(
                            columnTextStyle: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            cellTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            // gridBorderColor: Colors.red,
                            // activatedBorderColor: Colors.red,
                            // borderColor: Colors.yellow,
                          ),
                          columns: columns,
                          rows: rows,
                          onChanged: (PlutoOnChangedEvent event) {
                            print('test2');
                            print(event);
                          },
                          onLoaded: (PlutoOnLoadedEvent event) {
                            print('test1');
                            print(event.stateManager.currentCell);
                            print(event.stateManager.currentRow);
                            print(event.stateManager.currentSelectingRows);
                            print(event.stateManager.currentCellPosition);
                            print(event.stateManager.currentCell);
                            setState(() {
                              a = event.stateManager.currentCell;
                              b = event.stateManager.currentRow;
                              c = event.stateManager.currentSelectingRows;
                              d = event.stateManager.currentCellPosition;
                              e = event.stateManager.currentCell;
                            });

                            print(event);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                feedback: Container(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () {},
                  ),
                ),
                child: Container(
                  child: SafeArea(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: FloatingActionButton(
                            child: Icon(
                              openclosehide ? Icons.close : dialogSetValueHide ? Icons.close : Icons.add,
                            ),
                            onPressed: () {
                              setState(() {
                                openclosehide = !openclosehide;
                                if (openclosehide == true) {
                                  dialogSetValueHide = false;
                                }
                              });
                            },
                          ),
                        ),
                        if (openclosehide)
                          FloatingActionButton(
                            child: Icon(
                              Icons.add,
                            ),
                            onPressed: () {
                              setState(() {
                                openclosehide = !openclosehide;
                                dialogSetValueHide = !dialogSetValueHide;
                              });
                            },
                          ),
                        if (dialogSetValueHide)
                          Container(
                            height: 200,
                            width: 300,
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.yellow,
                                          child: textValueInput.length != 0 ? Text('$textValueInput') : Text(''),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('ตกลง'),
                                                ),
                                                onTap: () {
                                                  // print('ตกลง');

                                                  // print(textValueInput);
                                                  // numData = int.parse(textValueInput);
                                                  setState(() {
                                                    // inputValue(numData);
                                                    test();
                                                    // dialogSetValueHide = false;
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.black,
                                                  child: Text(
                                                    'ยกเลิก',
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                                onTap: () {
                                                  print('ยกเลิก');
                                                  setState(() {
                                                    // openclosehide = !openclosehide;
                                                    dialogSetValueHide = false;
                                                    textValueInput = null;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.orange,
                                                  child: Text('1'),
                                                ),
                                                onTap: () {
                                                  print('1');
                                                  setState(() {
                                                    textValueInput += '1';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('2'),
                                                ),
                                                onTap: () {
                                                  print('2');
                                                  setState(() {
                                                    textValueInput += '2';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.orange,
                                                  child: Text('3'),
                                                ),
                                                onTap: () {
                                                  print('3');
                                                  setState(() {
                                                    textValueInput += '3';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('4'),
                                                ),
                                                onTap: () {
                                                  print('4');
                                                  setState(() {
                                                    textValueInput += '4';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.orange,
                                                  child: Text('5'),
                                                ),
                                                onTap: () {
                                                  print('5');
                                                  setState(() {
                                                    textValueInput += '5';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('-'),
                                                ),
                                                onTap: () {
                                                  print('-');
                                                  setState(() {
                                                    textValueInput = textValueInput.substring(0, textValueInput.length - 1);
                                                    print(textValueInput);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('6'),
                                                ),
                                                onTap: () {
                                                  print('6');
                                                  setState(() {
                                                    textValueInput += '6';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.orange,
                                                  child: Text('7'),
                                                ),
                                                onTap: () {
                                                  print('7');
                                                  setState(() {
                                                    textValueInput += '7';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('8'),
                                                ),
                                                onTap: () {
                                                  print('8');
                                                  setState(() {
                                                    textValueInput += '8';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.orange,
                                                  child: Text('9'),
                                                ),
                                                onTap: () {
                                                  print('9');
                                                  setState(() {
                                                    textValueInput += '9';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('0'),
                                                ),
                                                onTap: () {
                                                  print('0');
                                                  setState(() {
                                                    textValueInput += '0';
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.red,
                                                  child: Text('clean'),
                                                ),
                                                onTap: () {
                                                  print('clean');
                                                  setState(() {
                                                    textValueInput = null;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    position = offset;
                  });
                },
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    position = details.offset;
                  });
                  print(position);
                  print(position.dx);
                  print(position.dy);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
