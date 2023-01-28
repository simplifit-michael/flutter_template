import 'package:flutter/material.dart';

class ItemFader extends StatefulWidget {
  final Widget child;
  final bool initialShow;
  const ItemFader({Key? key, required this.child, this.initialShow = true})
      : super(key: key);

  @override
  ItemFaderState createState() => ItemFaderState();
}

class ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    if (widget.initialShow) {
      _animationController.forward(from: 0);
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future show(bool forward) {
    setState(() => position = forward ? 1 : -1);
    return _animationController.forward();
  }

  Future hide(bool forward) async {
    setState(() => position = forward ? -1 : 1);
    return _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) => Transform.translate(
        offset: Offset(0, 65.0 * position * (1 - _animation.value)),
        child: Opacity(
          opacity: _animation.value,
          child: widget.child,
        ),
      ),
    );
  }
}
