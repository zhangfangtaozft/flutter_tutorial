import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slivers_fifth/detail_page.dart';
import 'dart:convert' as convert;
import 'my_delegate.dart';

import 'package:slivers_fifth/member.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Member> _members = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _members.clear();
          });
          const url = 'https://h5.48.cn/resource/jsonp/allmembers.php?gid=10';
          final res = await http.get(Uri.parse(url));
          if (res.statusCode != 200) {
            throw ('error');
          }
          final json = convert.jsonDecode(res.body);
          final members = json['rows'].map<Member>((row) {
            return Member(
              id: row['sid'],
              name: row['sname'],
              team: row['tname'],
              pinyin: row['pinyin'],
              abbr: row['abbr'],
              tid: row['tid'],
              tname: row['tname'],
              pid: row['pid'],
              pname: row['pname'],
              nickname: row['nickname'],
              company: row['company'],
              join_day: row['join_day'],
              height: row['height'],
              birth_day: row['birth_day'],
              star_sign_12: row['star_sign_12'],
              star_sign_48: row['star_sign_48'],
              birth_place: row['birth_place'],
              speciality: row['speciality'],
              hobby: row['hobby'],
            );
          });
          setState(() {
            _members = members.toList();
          });
        },
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(),
              SliverPersistentHeader(
                delegate: MyDelegate('Team SII', const Color(0xff91cdeb)),
                pinned: true,
              ),
              _buildTeamList('SII'),

              SliverPersistentHeader(
                delegate: MyDelegate('Team NII', const Color(0xffae86bb)),
                pinned: true,
              ),
              _buildTeamList('NII'),

              SliverPersistentHeader(
                delegate: MyDelegate('Team HII', const Color(0xfff39800)),
                pinned: true,
              ),
              _buildTeamList('HII'),

              SliverPersistentHeader(
                delegate: MyDelegate('Team X', const Color(0xffa9cc29)),
                pinned: true,
              ),
              _buildTeamList('X'),

              SliverPersistentHeader(
                delegate: MyDelegate('预备生', Colors.grey[400]!),
                pinned: true,
              ),
              _buildTeamList('预备生'),
            ],
          ),
        ),
      ),
    );
  }

  _buildTeamList(String teamName) {
    final List<Member> teamMembers =
        _members.where((m) => m.team == teamName).toList();
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final m = teamMembers[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage(member: m)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: m.avatarUrl,
                  child: ClipOval(
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Image.network(m.avatarUrl),
                    ),
                  ),
                ),
                Text(m.name),
              ],
            ),
          );
        },
        childCount: teamMembers.length,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
    );
  }
}
