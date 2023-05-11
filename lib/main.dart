import 'package:abu_bank/providers/account_data_provider.dart';
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
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'TransferFunds': TransferFundsWidget(),
      'WithdrawPage': WithdrawFundsWidget(),
      'Settingspage': SettingspageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
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
