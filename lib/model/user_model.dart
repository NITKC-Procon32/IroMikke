import 'package:flutter/material.dart';

import 'package:iromikke/entity/user.dart';

import 'package:iromikke/repository/user_repository.dart';

class UserModel with ChangeNotifier {

  User _user;

  final UserRepository repo = UserRepository();

  UserModel(){
    _fetch();
  }

  void _fetch() async {
    this._user = await repo.getProfile();
    notifyListeners();
  }

  String get name => this._user.name;
  int get userId => this._user.userId;
  int get viewerId => this._user.viewerId;

  set name(String name){
    _user.name = name;
    this._updateUser();
  }

  set userId(int userId){
    _user.userId = userId;
    this._updateUser();
  }

  set viewerId(int viewerId){
    _user.viewerId = viewerId;
    this._updateUser();
  }

  void _updateUser() async {
    await repo.updateProfile(_user);
    _fetch();
  }

}