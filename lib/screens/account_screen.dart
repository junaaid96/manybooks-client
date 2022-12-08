import 'package:flutter/material.dart';
import 'package:manybooks_v2/models/db_models/user_model.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/widgets/appbar.dart';
import 'package:manybooks_v2/widgets/account_button.dart';
import 'package:states_rebuilder/scr/state_management/legacy/state_builder.dart';
import '../models/db_models/user_model.dart';
import '../models/states/stb.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
// List<UserModel>? allUsers = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    UserModel? abc = await ApiCalling.getUserProfileData();
    stbs.state.setprofiledata(abc);
    // setState(() {
    //   allUsers = abc;
    // });
    // print("object");
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => stbs,
      builder: (context, _) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          'asset/images/profile.png',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                    text: "${stbs.state.userData?.name}\n",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                  text: 'Wild Life Photographer\n',
                                  style: TextStyle(
                                      height: 1,
                                      fontFamily: 'OpenSans',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: 'Status Label',
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 32.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 2, color: Colors.black)),
                        child: Icon(
                          Icons.edit,
                          color: Color(0xff263238),
                          size: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sub Heading",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    DrawerListTile(
                      title: 'Balance',
                      svgSrc: 'asset/images/svg_icons/wallet.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'Notifition',
                      svgSrc: 'asset/images/svg_icons/notification.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'My Books',
                      svgSrc: 'asset/images/svg_icons/books.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'My Notes',
                      svgSrc: 'asset/images/svg_icons/notes.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'My Ratings',
                      svgSrc: 'asset/images/svg_icons/rating.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'My Stats',
                      svgSrc: 'asset/images/svg_icons/stats.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'Send Feedback',
                      svgSrc: 'asset/images/svg_icons/feedback.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'Share with Friends',
                      svgSrc: 'asset/images/svg_icons/share.svg',
                      press: () {},
                    ),
                    DrawerListTile(
                      title: 'Logout',
                      svgSrc: 'asset/images/svg_icons/poweroff.svg',
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
