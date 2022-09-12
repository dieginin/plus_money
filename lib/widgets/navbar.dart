import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class NavBarButton {
  final IconData icon;
  final Function onPressed;

  NavBarButton({required this.icon, required this.onPressed});
}

class NavBar extends StatelessWidget {
  final Color backgroundColor;
  final Color activeColor;
  final Color inActiveColor;
  final List<NavBarButton> items;

  const NavBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inActiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Builder(
        builder: (context) {
          Provider.of<_MenuModel>(context).activeColor = activeColor;
          Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).inActiveColor = inActiveColor;

          return _MenuBackground(
            child: _MenuItems(items),
          );
        },
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  const _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
      width: 300,
      height: 60,
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<NavBarButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _MenuButton(i, menuItems[i])),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final int i;
  final NavBarButton item;

  const _MenuButton(this.i, this.item);

  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = i;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: menuModel.itemSeleccionado == i ? 30 : 20,
        color: menuModel.itemSeleccionado == i ? menuModel.activeColor : menuModel.inActiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inActiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
