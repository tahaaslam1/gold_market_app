import 'user_model.dart';

class Application {
  final List<User> users;

  Application({ this.users});

  factory Application.fromJson(List<dynamic> parsedJson) {
    List<User> users = new List<User>();

    users = parsedJson.map((i) => User.fromJson(i)).toList();

    return new Application(users: users);
  }

  Map<String, dynamic> toJson() => {
				'users': users.map((e) => e.toJson()).toList(),
			};
}
