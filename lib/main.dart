import 'package:abu_bank/providers/account_data_provider.dart';
import 'package:abu_bank/providers/tab_provider.dart';
import 'package:abu_bank/theme/abu_bank_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'index.dart';
import 'theme/abu_bank_theme.dart';
import 'theme/internationalization.dart';

final numberFormat = NumberFormat(',##0.00');
String boxName = 'abubox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AbuBankTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = AbuBankTheme.themeMode;

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        AbuBankTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AccountDataProvider()),
          ChangeNotifierProvider(create: (context) => TabProvider()),
        ],
        child: MaterialApp(
          title: 'Abu Bank',
          localizationsDelegates: [
            FFLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: _locale,
          supportedLocales: const [
            Locale('en'),
          ],
          theme: ThemeData(brightness: Brightness.light),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: _themeMode,
          home: WelcomePageWidget(),
        ),
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  final tabs = [
    HomePageWidget(),
    TransferFundsWidget(),
    WithdrawFundsWidget(),
    SettingspageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    TabProvider tabProvider = Provider.of<TabProvider>(context);
    return Scaffold(
      body: tabs[tabProvider.currentTab],
      bottomNavigationBar: GNav(
        selectedIndex: tabProvider.currentTab,
        onTabChange: (i) {
          tabProvider.changeTab(i);
        },
        backgroundColor: AbuBankTheme.of(context).primary3,
        color: Color(0x8A000000),
        activeColor: AbuBankTheme.of(context).primary,
        tabBackgroundColor: AbuBankTheme.of(context).primary3,
        tabBorderRadius: 100.0,
        tabMargin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
        gap: 3.0,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        duration: Duration(milliseconds: 500),
        haptic: true,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24.0,
          ),
          GButton(
            icon: Icons.compare_arrows_rounded,
            text: 'Transfer',
            iconSize: 24.0,
          ),
          GButton(
            icon: CupertinoIcons.arrow_down_left,
            text: 'Withdraw',
            iconSize: 24.0,
          ),
          GButton(
            icon: Icons.settings_rounded,
            text: 'Settings',
            iconSize: 24.0,
          )
        ],
      ),
    );
  }
}
