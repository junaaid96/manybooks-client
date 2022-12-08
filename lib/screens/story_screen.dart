import 'package:flutter/material.dart';
import 'package:manybooks_v2/data/storydata.dart';
import 'package:manybooks_v2/models/db_models/story_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:states_rebuilder/scr/state_management/legacy/state_builder.dart';
import '../models/db_models/book_model.dart';
import '../models/states/stb.dart';
import '../models/story_resp.dart';
import '../utils/api_callings.dart';
import '../utils/storybtn.dart';
import '../widgets/add_story.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  // List<StoryData> stories = [
  //   StoryData("UserOne", "https://randomuser.me/api/portraits/men/75.jpg",
  //       "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"),
  //   StoryData("UserTwo", "https://randomuser.me/api/portraits/women/65.jpg",
  //       "https://tools.toywiz.com/_images/_webp/_products/lg/funkots4vetriloquistdummy.webp"),
  //   StoryData("UserThree", "https://randomuser.me/api/portraits/men/55.jpg",
  //       "https://cdn.shopify.com/s/files/1/0024/9803/5810/products/406154-Product-0-I.jpg?v=1572325957"),
  //   StoryData("UserFour", "https://randomuser.me/api/portraits/women/55.jpg",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR2j7pFkgOlhj64woUEdx2tPbs_xI5-hlzyg&usqp=CAU"),
  //   StoryData("UserFive", "https://randomuser.me/api/portraits/men/57.jpg",
  //       "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"),
  // ];
  // List<StoryModel> stories = [];
  @override
  void initState() {
    super.initState();
    getStoriesData();
  }

  getStoriesData() async {
    List<StoryModel> storiesdata = await ApiCalling.getStories();
    stbs.state.setStories(storiesdata);
// return storiesdata;
// return storiesdata.
    // stories = stbs.state.stories;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StateBuilder(
          observe: () => stbs,
          builder: (context, _) => SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stbs.state.stories.length,
                  itemBuilder: (((context, index) => Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          if (index == 0)
                            AddStoryButton(
                                stbs.state.stories[index].image,
                                stbs.state.stories[index].userId!.name,
                                context),
                          if (stbs.state.stories.isNotEmpty)
                            StoryButton(
                                stbs.state.stories[index].image,
                                stbs.state.stories[index].userId!.name,
                                context),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ))))),
        ));
  }
}
