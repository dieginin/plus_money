import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:plus_money/helpers/mostrar_ajustes.dart';
import 'package:plus_money/theme/theme.dart';
import 'package:plus_money/widgets/widgets.dart';

final primary = lightTheme.colorScheme.primary;
final secondary = lightTheme.colorScheme.secondary;
final scaffoldBg = lightTheme.scaffoldBackgroundColor;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _DrawerMenu(),
      body: SafeArea(
        child: Stack(
          children: [
            _Menu(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: scaffoldBg,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          color: secondary,
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(FontAwesomeIcons.bars),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: secondary,
          // child: const Icon(FontAwesomeIcons.user, size: 22),
          child: const Text('DB'),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundColor: secondary,
                      child: const Text('DB', style: TextStyle(fontSize: 35)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Diego Balestra',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const Spacer(),
                  _IdEquipo(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const DrawerTitulo('Empleados'),
                  DrawerSubtitulo('Agregar empleados', onTap: () {}),
                  DrawerSubtitulo('Editar empleados', onTap: () {}),
                  const DrawerTitulo('Salarios'),
                  DrawerSubtitulo('Registrar préstamo', onTap: () {}),
                  DrawerSubtitulo('Registrar salario', onTap: () {}),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 65,
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => mostrarAjustes(context, 'Ajustes'),
                child: Icon(FontAwesomeIcons.gear, color: secondary),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IdEquipo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(const ClipboardData(text: '3876432784'));
        Fluttertoast.showToast(
          msg: "Copiado al portapapeles",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[350],
          textColor: secondary,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('ID equipo:', style: TextStyle(color: Colors.black38)),
          SizedBox(width: 10),
          Text('3876432784', style: TextStyle(color: Colors.black38)),
          SizedBox(width: 10),
          Icon(FontAwesomeIcons.arrowUpRightFromSquare, size: 15, color: Colors.black38),
        ],
      ),
    );
  }
}

class DrawerSubtitulo extends StatelessWidget {
  final String subTitulo;
  final Function()? onTap;

  const DrawerSubtitulo(this.subTitulo, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 48,
        child: Row(
          children: [
            const Icon(Icons.subdirectory_arrow_right, color: Colors.black12),
            const SizedBox(width: 5),
            Text(subTitulo, style: const TextStyle(color: Colors.black)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.black12, size: 20),
          ],
        ),
      ),
    );
  }
}

class DrawerTitulo extends StatelessWidget {
  final String titulo;

  const DrawerTitulo(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: secondary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthPantalla = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 5,
      child: SizedBox(
        width: widthPantalla,
        child: Row(
          children: [
            const Spacer(),
            NavBar(
              backgroundColor: scaffoldBg,
              activeColor: primary,
              inActiveColor: secondary,
              items: [
                NavBarButton(icon: FontAwesomeIcons.chartSimple, onPressed: () {}),
                NavBarButton(icon: FontAwesomeIcons.moneyBillTransfer, onPressed: () {}),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
