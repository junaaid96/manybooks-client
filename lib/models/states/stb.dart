import 'package:manybooks_v2/models/db_models/search_idle_model.dart';
import 'package:manybooks_v2/models/db_models/user_model.dart';
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/models/db_models/morebooks_model.dart';
import 'package:manybooks_v2/screens/search_idle_response.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../db_models/book_model.dart';
import '../db_models/story_model.dart';

class Stb {
  int counter = 0;
  bool? loading;
  int selectedIndex = 0;
  int page = 1;
  List<CategoryModel> categorizedBooks = [];
  MoreBooksModel morePopularBooks = MoreBooksModel(data: [], total: 0);
  MoreBooksModel moreRecentBooks = MoreBooksModel(data: [], total: 0);
  List<MoreBooksModel> moreRecentlyUploadedBooks = [];
  List<BookModel> recentSearchBooks = [];
  List<UserModel> allUsers = [];
  List<BookModel> result = [];
  List<BookModel> topSearchBooks = [];
  List<SearchIdleResponse> searchidleresponse = [];
  List<StoryModel> stories = [];
  List<String> popularimages = [], populartitles = [], popularwriters = [];
  List<String> recentimages = [], recenttitles = [], recentwriters = [];
  UserModel? userData;

  increase(int number) {
    counter += number;
    stbs.notify(); // used instead of rebuildStates()
  }

  changeBottomNavigationIndex(int index) {
    selectedIndex = index;
    stbs.notify();
  }

  setSearchIdleSearchResponseData(List<SearchIdleResponse> searchidleresponse) {
    this.searchidleresponse = searchidleresponse;
    stbs.notify();
  }

  setStories(List<StoryModel> stories) {
    this.stories = stories;
    stbs.notify();
  }

  // setUsers(List<UserModel> allUsers) {
  //   this.allUsers = allUsers;
  //   stbs.notify();
  // }

  setprofiledata(UserModel? data) {
    userData = data;
    stbs.notify();
  }

  setRecentSearchBooks(List<BookModel> recentSearchBooks) {
    this.recentSearchBooks = recentSearchBooks;
    stbs.notify();
  }

  setTopSearchBooks(List<BookModel> topSearchBooks) {
    this.topSearchBooks = topSearchBooks;
    stbs.notify();
  }

  setCategorizedBooks(List<CategoryModel> categorizedBooks) {
    this.categorizedBooks = categorizedBooks;
    stbs.notify();
  }

  setMorePopularBooks(MoreBooksModel moreBooks) {
    morePopularBooks.data!.addAll(moreBooks.data!);
    morePopularBooks.total = moreBooks.total;
    stbs.notify();
  }

  setMoreRecentBooks(MoreBooksModel moreBooks) {
    moreRecentBooks.data!.addAll(moreBooks.data!);
    moreRecentBooks.total = moreBooks.total;
    stbs.notify();
  }

  setMorePopularSearchedBooks(MoreBooksModel moreBooks) {
    morePopularBooks.data!.addAll(moreBooks.data!);
    morePopularBooks.total = moreBooks.total;
    stbs.notify();
  }

  setMoreRecentSearchedBooks(MoreBooksModel moreBooks) {
    moreRecentBooks.data!.addAll(moreBooks.data!);
    moreRecentBooks.total = moreBooks.total;
    stbs.notify();
  }

  getPopularBooks(BookModel item) {
    popularimages.add(item.cover);
    populartitles.add(item.name);
    popularwriters.add(item.authorId!.name);
    stbs.notify();
  }

  getRecentBooks(BookModel item) {
    recentimages.add(item.cover);
    recenttitles.add(item.name);
    recentwriters.add(item.authorId!.name);
    stbs.notify();
  }

  setQueryBook(bool loading, List<BookModel> result, int page) {
    this.loading = false;
    this.result = result;
    this.page = page + 1;
    stbs.notify();
  }
}

final stbs = RM.inject(() => Stb());
