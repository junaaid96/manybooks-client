import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googleapis/appengine/v1.dart';
import 'package:manybooks_v2/models/states/stb.dart';
import 'package:manybooks_v2/screens/account_screen.dart';
import 'package:manybooks_v2/screens/home_screen.dart';
import 'package:manybooks_v2/screens/library_screen.dart';
import 'package:manybooks_v2/screens/search_screen.dart';
import 'package:manybooks_v2/screens/upload_screen.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/widgets/appbar.dart';
import 'package:manybooks_v2/widgets/last_read_book.dart';
import 'package:one_context/one_context.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:manybooks_v2/data/storydata.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../utils/storybtn.dart';
import 'book_details_screen.dart';

class DashboardScreen extends StatelessWidget {
  // int currentScreenIndex = stbs.state.selectedIndex;
  List<Widget> screenList = [
    HomeScreen(),
    LibraryScreen(),
    SearchScreen(),
    UploadScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => stbs,
      builder: (context, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarScreen(title: "MANYBOOKS",),
        ),
        body: screenList.elementAt(stbs.state.selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 12.0,
                  offset: Offset(0.0, 5.5))
            ],
          ),
          child: BottomNavigationBar(
            // elevation: 60,
            type: BottomNavigationBarType.fixed,
            currentIndex: stbs.state.selectedIndex,
            selectedItemColor: Color(0xff263238),
            onTap: stbs.state.changeBottomNavigationIndex,
            unselectedItemColor: Color(0xff909091),
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff263238)),
            unselectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff909091)),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_library_outlined),
                label: "Library",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.upload_outlined), label: "Upload"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Account"),
            ],
          ),
        ),
      ),
    );
  }
}
