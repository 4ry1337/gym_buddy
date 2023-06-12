import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HorizontalPicker.controller.dart';

class HorizontalPicker extends GetView<NumberPickerController> {
  final double minValue, maxValue;
  final Function(double) onChanged;
  final String suffix;

  const HorizontalPicker({super.key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    this.suffix = "",
  }) : assert(minValue < maxValue);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: ListWheelScrollView(
              itemExtent: 60,
              onSelectedItemChanged: (item) {
                /*curItem = item;
                int decimalCount = 1;
                num fac = pow(10, decimalCount);
                valueMap[item]["value"] = (valueMap[item]["value"] * fac).round() / fac;
                widget.onChanged(valueMap[item]["value"]);
                for (var i = 0; i < valueMap.length; i++) {
                  if (i == item) {
                    valueMap[item]["color"] = widget.activeItemTextColor;
                    valueMap[item]["fontSize"] = 15.0;
                    valueMap[item]["hasBorders"] = true;
                  } else {
                    valueMap[i]["color"] = widget.passiveItemsTextColor;
                    valueMap[i]["fontSize"] = 14.0;
                    valueMap[i]["hasBorders"] = false;
                  }
                }*/
              },
              children: controller.valueMap.map((Map curValue) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: widget.cursorColor.withOpacity(0.3),
                    ),
                    width: 3,
                  ),
                );
              }).toList()),
        ),
        /*Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: widget.cursorColor.withOpacity(0.3),
            ),
            width: 3,
          ),
        )*/
      ],
    );
  }
}