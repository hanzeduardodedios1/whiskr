// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Use this URL for the Android emulator
const String apiUrl = 'http://10.0.2.2:5000/api/users/1/friends';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late Future<List<dynamic>> _usersFuture;
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers();
  }

  Future<List<dynamic>> fetchUsers() async {
    //hardcode currentuserid for now until we have google auth set up
    const int currentUserId = 1;
    final String url = 'http://10.0.2.2:5000/api/users/$currentUserId/friends';

    try {

      
      final response = await http.get(Uri.parse(url));
  
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final data = json.decode(response.body);
        return data['friends'];
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load friends');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<void> removeFriend(int friendId) async {
    const int currentUserId = 1;
    final String url = 'http://10.0.2.2:5000/api/users/$currentUserId/friends/$friendId';

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        // print('Friendship deleted successfuly!');
        //refresh UI by fetching the list again
        setState(() {
          _usersFuture = fetchUsers();
        });
      } else {
        print('Failed to delete friendship: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

Future<void> addFriendByUsername(String username) async {
  const int currentUserId = 1; // You'll replace this with the logged-in user's ID
  const String url = 'http://10.0.2.2:5000/api/friends/add_by_username';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'user_id': currentUserId,
        'username': username,
      }),
    );

    if (response.statusCode == 201) {
      print('Friendship added successfully!');
      setState(() {
        _usersFuture = fetchUsers();
      });
    } else {
      print('Failed to add friendship: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFFDDCAB8),
      centerTitle: true,
      title: const Text('Friends'),
      // The add button in the app bar is not needed for this UI
      // since the input field is now on the page itself.
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Add friend by username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  final String username = _usernameController.text;
                  if (username.isNotEmpty) {
                    // This is the correct call to the addFriendByUsername function
                    addFriendByUsername(username); 
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
        // This Expanded widget is crucial to prevent layout errors
        Expanded(
          child: FutureBuilder<List<dynamic>>(
            future: _usersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No users found.'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final friend = snapshot.data![index];
                    final friendId = friend['id'];
                    final friendUsername = friend['username'];

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          friendUsername,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('ID: $friendId'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                removeFriend(friendId);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}
}