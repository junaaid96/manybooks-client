import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manybooks_v2/models/db_models/category_model.dart';
import 'package:manybooks_v2/models/db_models/morebooks_model.dart';
import 'package:manybooks_v2/models/db_models/user_model.dart';
import 'package:manybooks_v2/models/states/stb.dart';
import 'package:manybooks_v2/screens/search_idle_response.dart';
import 'package:manybooks_v2/models/story_resp.dart';
import 'package:manybooks_v2/screens/home_screen.dart';
import 'package:one_context/one_context.dart';
import 'package:prefs/prefs.dart';
import '../models/after_login.dart';
import '../models/db_models/book_model.dart';
import '../models/db_models/story_model.dart';
import '../screens/booklist.dart';
import 'helpers.dart';
// const API_ENDPOINT = 'http://192.168.0.103:8000';
const API_ENDPOINT = 'http://192.168.1.143:8000';

// neo home ip
// const API_ENDPOINT = 'http://192.168.0.107:8000';

// const API_ENDPOINT = 'http://192.168.1.109:8000';
// const API_ENDPOINT='http://172.20.10.9:8000';
//huk home ip 192.168.0.103
// const API_ENDPOINT = 'http://192.168.0.103:8000';
String token = Prefs.getString('tokenData');
var justToken = json.decode(token);

class ApiCalling {
  String imgURL = "";
  List<String> images = [], titles = [], writers = [];

  static Future<String?> login(AfterLogin afterLogin) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse("$API_ENDPOINT/users/login"));
    request.body = json.encode({
      "email": afterLogin.email,
      "name": afterLogin.displayName,
      "token": afterLogin.token,
      "tokenType": afterLogin.tokenType
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode < 400) {
      return await response.stream.bytesToString();
    } else {
      return null;
    }
  }

  Future<dynamic> searchBook(String searchController) async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request('GET',
        Uri.parse('$API_ENDPOINT/books/searchidle?search=$searchController'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      List<BookModel> books = Helpers.convertBookJsonToList(jsonStr);
      OneContext()
          .push(MaterialPageRoute(builder: (_) => BookList(books: books)));
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> getBooks() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request('GET', Uri.parse('$API_ENDPOINT/books'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      List<BookModel> books = Helpers.convertBookJsonToList(jsonStr);
      // OneContext().pushNamed(
      //   "/booklist",
      //   arguments: books,
      // );
      print(books);
      return books;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> getCategorizedBooks() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request =
        http.Request('GET', Uri.parse('$API_ENDPOINT/books/categorized'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      // List<BookModel> books = await Helpers.convertBookJsonToList(jsonStr);
      List<CategoryModel> categorizedBooks =
          await Helpers.convertCategoryJsonToList(jsonStr);

      // OneContext().pushNamed(
      //   "/booklist",
      //   arguments: books,
      // );
      return categorizedBooks;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> searchIdleResponse() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request =
        http.Request('GET', Uri.parse('$API_ENDPOINT/books/searchidle'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      // List<BookModel> books = await Helpers.convertBookJsonToList(jsonStr);
      List<CategoryModel> categorizedBooks =
          await Helpers.convertCategoryJsonToList(jsonStr);

      return categorizedBooks;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> getStories() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request('GET', Uri.parse('$API_ENDPOINT/stories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      StoryResp storyResp = StoryResp.fromRawJson(jsonStr);
// StoryModel stories = Helpers.convertStoryJsonToList(storyResp.data);
      return storyResp.data;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> createStories(imgURL) async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request('POST', Uri.parse('$API_ENDPOINT/stories'));
    request.bodyFields = {'image': imgURL, 'text': '', 'likes': ''};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<String> uploadToImgbb(imagePath) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://api.imgbb.com/1/upload?key=5c692cb944e742f97ee684de4459c870'));
    request.files.add(await http.MultipartFile.fromPath('image', '$imagePath'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonResponse = await response.stream.bytesToString();
      // ImgbbResponse imgbb = ImgbbResponse.fromRawJson(jsonResponse);
      // print(imgbb.data.displayUrl);
      var temp = json.decode(jsonResponse);
      imgURL = temp['data']['display_url'];
      return imgURL;
    } else {
      return "";
    }
  }

  static Future<dynamic> getRecentSearchBooks(page) async {
    var limit = 10;
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$API_ENDPOINT/books/recentmorebooks?page=${page}&limit=${limit}'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonStr = await response.stream.bytesToString();
      return MoreBooksModel.fromRawJson(jsonStr);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> getTopSearchBooks(page) async {
       var limit = 10;
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$API_ENDPOINT/books/popularmorebooks?page=${page}&limit=${limit}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonStr = await response.stream.bytesToString();
      return MoreBooksModel.fromRawJson(jsonStr);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic> getPopularMoreBooks(page) async {
    // var page = 1;
    var limit = 10;
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$API_ENDPOINT/books/popularmorebooks?page=${page}&limit=${limit}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonStr = await response.stream.bytesToString();
      return MoreBooksModel.fromRawJson(jsonStr);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<dynamic>getRecentMoreBooks(page) async {
    // var page = 1;
    var limit = 10;
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request(
        'GET',
        Uri.parse(
            '$API_ENDPOINT/books/recentmorebooks?page=${page}&limit=${limit}'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonStr = await response.stream.bytesToString();
      MoreBooksModel abc = MoreBooksModel.fromRawJson(jsonStr);
      print("object");
      return abc;
    } else {
      print(response.reasonPhrase);
    }
  }

   static Future<UserModel?> getUserProfileData() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request = http.Request('GET', Uri.parse('$API_ENDPOINT/users/profile'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      UserModel user = UserModel.fromRawJson(jsonStr);
      return user;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }


   Future<dynamic> searchidleresponse() async {
    var headers = {'Authorization': "Bearer ${justToken["access_token"]}"};
    var request =
        http.Request('GET', Uri.parse('$API_ENDPOINT/books/categorized'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      String jsonStr = await response.stream.bytesToString();
      // print();
      // List<BookModel> books = await Helpers.convertBookJsonToList(jsonStr);
      List<CategoryModel> categorizedBooks =
          await Helpers.convertCategoryJsonToList(jsonStr);

      return categorizedBooks;
    } else {
      print(response.reasonPhrase);
    }
  }
}