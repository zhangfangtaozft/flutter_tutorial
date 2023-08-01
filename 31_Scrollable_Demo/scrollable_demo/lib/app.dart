import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:scrollable_demo/git_event.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _events = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Demo'),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            await _refresh();
          },
          child: ListView(
            children: _events.map<Widget>((event) {
              return Dismissible(
                key: ValueKey(event.id),
                confirmDismiss: (_) async {
                  return showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content:
                              const Text('Do you want to delete the item?'),
                          actions: [
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.red)),
                            )
                          ],
                        );
                      });
                },
                onDismissed: (_) {
                  setState(() {
                    _events.removeWhere((element) => element.id == event.id);
                  });
                },
                child: ListTile(
                  leading: Image.network(event.avatarUrl),
                  title: Text(event.userName),
                  subtitle: Text(event.repoName),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future _refresh() async {
    var response = await http
        .get(Uri.https('api.github.com', '/events', {'q': '{https}'}));
    if (response.statusCode == 200) {
      final json = convert.jsonDecode(response.body);
      setState(() {
        _events.clear();
        _events.addAll(json.map((item) => GitEvent(item)));
      });
    }
  }
}
