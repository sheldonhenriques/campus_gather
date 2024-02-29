import 'package:campus_gather/models/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Users {
  final UserRepository _userRepository;

  Users(this._userRepository);

  Future<List<User>> getUsers() async {
    return _userRepository.getUsers();
  }

  Future<void> createUser(User user) async {
    await _userRepository.createUser(user);
  }

  Future<void> deleteUser(String userId) async {
    await _userRepository.deleteUser(userId);
  }

  Future<void> updateUser(User user) async {
    await _userRepository.updateUser(user);
  }

  Future<List<User>> searchUser(String query) async {
    return _userRepository.searchUser(query);
  }
}

class UserRepository {
  final Db _db;

  UserRepository(this._db);

  Future<List<User>> getUsers() async {
    final usersCollection = _db.collection('users');
    final users = await usersCollection.find().toList();
    return users.map((userJson) => User.fromJson(userJson)).toList();
  }

  Future<void> createUser(User user) async {
    final usersCollection = _db.collection('users');
    await usersCollection.insertOne(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    final usersCollection = _db.collection('users');
    await usersCollection.deleteOne(where.eq('userId', userId));
  }

  Future<void> updateUser(User user) async {
    final usersCollection = _db.collection('users');

    await usersCollection.update(
      where.eq('userId', user.userId),
      user.toJson(),
    );
  }

  Future<List<User>> searchUser(String query) async {
    final usersCollection = _db.collection('users');
    final searchRegex = RegExp(query, caseSensitive: false);

    final searchResult = await usersCollection.find(
      {
        '\$or': [
          {
            'username': {'\$regex': searchRegex, '\$options': 'i'}
          },
          {
            'firstName': {'\$regex': searchRegex, '\$options': 'i'}
          },
          {
            'lastName': {'\$regex': searchRegex, '\$options': 'i'}
          },
          {
            'campusEmail': {'\$regex': searchRegex, '\$options': 'i'}
          }
        ]
      },
    ).toList();

    return searchResult.map((json) => User.fromJson(json)).toList();
  }
}
