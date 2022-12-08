import 'package:flutter/material.dart';
import 'package:manybooks_v2/widgets/appbar.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar _getTabBar() {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicator: RectangularIndicator(
          bottomLeftRadius: 50,
          topLeftRadius: 50,
          topRightRadius: 50,
          bottomRightRadius: 50),
      tabs: <Widget>[
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.bookmark,
                size: 15,
              ),
              Text(
                'Chapters',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.highlight_alt,
                size: 15,
              ),
              Text(
                'Highlights',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.note_alt_sharp,
                size: 15,
              ),
              Text(
                'Notes',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarScreen(title: "MANYBOOKS"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getTabBar(),
                    SizedBox(height: 10),
                    Text(
                      "Total 12 Chapters are here ",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 84,
                      child: _getTabBarView(<Widget>[
                        // SizedBox(height: 10),
                        Container(
                          color: Color(0xEFEFEF),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 84,
                                      width: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderRadius: BorderRadius.all(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: const Offset(0.0, 0.0),
                                                // blurRadius: 2.0,
                                                spreadRadius: 0.0)
                                          ]),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 39,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Chapter Name",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Chapter's Sub Title/ A Small Description here for reader",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                ]),
                          ),
                        ),
                        Container(
                          color: Color(0xEFEFEF),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 84,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        // borderRadius: BorderRadius.all(6),
                                        color: Colors.red),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Highlighted Text 1",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Chapter's Sub Title/ A Small Description here for reader",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.mode_edit_outline_outlined),
                                ]),
                          ),
                        ),
                        Container(
                          color: Color(0xEFEFEF),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 84,
                                      width: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderRadius: BorderRadius.all(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: const Offset(0.0, 0.0),
                                                // blurRadius: 2.0,
                                                spreadRadius: 0.0)
                                          ]),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 39,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Chapter Name",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Chapter's Sub Title/ A Small Description here for reader",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                ]),
                          ),
                        )
                      ]),
                    ),
                  ]),
            )));
  }
}
