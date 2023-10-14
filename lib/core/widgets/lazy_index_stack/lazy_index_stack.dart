import 'package:flutter/widgets.dart';

class LazyIndexStack extends StatefulWidget {
  const LazyIndexStack({
    super.key,
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    this.textDirection,
    this.index = 0,
    this.children = const <Widget>[],
    this.unloadWidget = const SizedBox.shrink(),
  });
  final Widget unloadWidget;
  final AlignmentGeometry alignment;
  final StackFit sizing;
  final TextDirection? textDirection;
  final int index;
  final List<Widget> children;
  @override
  State<LazyIndexStack> createState() => _LazyIndexStackState();
}

class _LazyIndexStackState extends State<LazyIndexStack> {
  late List<Widget> _children;
  final _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _children = _initialChildren();
  }

  @override
  void didUpdateWidget(final LazyIndexStack oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.children.length != oldWidget.children.length) {
      _children = _initialChildren();
    }

    _children[widget.index] = widget.children[widget.index];
  }

  List<Widget> _initialChildren() {
    return widget.children.asMap().entries.map((entry) {
      final index = entry.key;
      final childWidget = entry.value;
      return index == widget.index ? childWidget : widget.unloadWidget;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      key: _stackKey,
      index: widget.index,
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      children: _children,
    );
  }
}
