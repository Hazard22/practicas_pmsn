import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:rojas_johan_practicas/provider/theme_provider.dart';
import 'package:rojas_johan_practicas/screens/list_post_screen.dart';
import 'package:rojas_johan_practicas/settings/styles.dart';
import 'package:rojas_johan_practicas/widgets/modal_add_post.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkThemEnable = false;
  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido usuario'),
      ),
      body: const ListPostScreen(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _openCustomeDialog,
          icon: const Icon(Icons.add_comment),
          label: Text('Post it!')),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                accountName: Text('Usuario chido 2'),
                accountEmail: Text('usuario@gmail.com')),
            Table(
              border: TableBorder.all(),
              /*columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(64),
              },*/
              defaultColumnWidth: FixedColumnWidth(32.0),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          print("tema 1");
                          theme.setthemeData(StylesApp.lightTheme(context));
                        },
                        child: Text("Tema 1")),
                    TextButton(
                        onPressed: () {
                          print("tema 2");
                          theme.setthemeData(StylesApp.darkTheme(context));
                        },
                        child: Text("Tema 2")),
                    TextButton(
                        onPressed: () {
                          print("tema 3");
                          theme.setthemeData(StylesApp.warmTheme(context));
                        },
                        child: Text("Tema 3")),
                  ],
                ),
              ],
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkThemEnable,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setthemeData(StylesApp.darkTheme(context))
                    : theme.setthemeData(StylesApp.lightTheme(context));

                isDarkThemEnable = isDarkModeEnabled;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  _openCustomeDialog() {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: const ModalAddPost(),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
    );
  }
}
