import 'dart:developer';

import 'package:flutter/material.dart';
import 'app_text.dart';

class AppDropMenu<T> extends StatefulWidget {
  final List<T> items;
  final Function(T?) onChanged;
  final String hint;
  T? selectedItem;
  final bool isBordered;
  final bool isUnderLined;
  final double radius;
  final bool expanded;
  final Color? backgroundColor;
  final bool centerHint;

  AppDropMenu({
    this.selectedItem,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.isBordered = false,
    this.isUnderLined = false,
    this.radius = 8,
    this.expanded = false,
    Key? key,
    this.backgroundColor,
    this.centerHint = false,
  }) : super(key: key);

  @override
  State<AppDropMenu<T>> createState() => AppDropMenuState<T>();
}

class AppDropMenuState<T> extends State<AppDropMenu<T>> {
  // T? selectedItem;

  @override
  void initState() {
    // selectedItem = widget.initialValue;
    super.initState();
    log("selectedItem==> ${widget.selectedItem}");
  }

  void clearSelection() {
    setState(() {
      widget.selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: widget.isBordered
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(color: Colors.black),
              color: widget.backgroundColor ?? Colors.white,
            )
          : BoxDecoration(color: widget.backgroundColor ?? Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<T>(
        value: widget.selectedItem,
        hint: Align(
          alignment:
              widget.centerHint ? AlignmentDirectional.center : AlignmentDirectional.centerStart,
          child: Text(widget.selectedItem == null ? widget.hint : widget.selectedItem.toString(),
          maxLines: 2, textAlign: TextAlign.center, style:const TextStyle(fontSize: 12,),),
        ),
        // underline: widget.isUnderLined? const Padding(
        //   padding:  EdgeInsets.symmetric(vertical: 4.0),
        //   child: Divider(color: Colors.grey),
        // ): const SizedBox(),
        isExpanded: widget.expanded,
        iconEnabledColor: Colors.black,
        iconSize: 25,
        icon: const Icon(Icons.keyboard_arrow_down),
        // iconEnabledColor: Theme.of(context).primaryColor,
        items: widget.items.isEmpty
            ? []
            : widget.items
                .map((e) => DropdownMenuItem<T>(
                    child: AppText(
                      e.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    value: widget.items[widget.items.indexOf(e)],
                  ),
                )
                .toList(),
        onChanged: (value) {
          setState(() {
            widget.selectedItem = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
