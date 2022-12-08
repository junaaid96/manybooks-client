import 'package:flutter/material.dart';
import 'package:manybooks_v2/ui/styles/styles.dart';
import 'package:manybooks_v2/widgets/appbar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key? key}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarScreen(title: "MANYBOOKS"),
      ),
      body: DefaultTabController(

        length: 3,
        initialIndex: 0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Work",
                      ),
                      Tab(
                        text: "Play",
                      ),
                      // TabBarView(children: [
                      //   Container(child: Text('sbc'))
                      // ])
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: RectangularIndicator(
                      bottomLeftRadius: 100,
                      bottomRightRadius: 100,
                      topLeftRadius: 100,
                      topRightRadius: 100,
                      
                    ),

              
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
