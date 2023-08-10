import 'package:flutter/material.dart';
import 'package:slivers_fifth/member.dart';

class DetailPage extends StatelessWidget {
  final Member member;
  const DetailPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(member.name),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const BackButton(color: Colors.black,),
            pinned: true,
            backgroundColor: Colors.pink[50],
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SNH48-${member.name}', style: TextStyle(color: Colors.grey[800])),
              background: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Image.network(
                              'https://th.bing.com/th/id/R.ff9045ad67b5b1dcc12c969daf0efc16?rik=RSqXxIB41VgftQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fY6lyC3E.jpg&ehk=b3B8GLvtAZT8ER%2fZJeeWs7OkAve2pN48vI2JDhqrH84%3d&risl=&pid=ImgRaw&r=0',
                          fit: BoxFit.cover,
                          )
                      ),
                      Container(
                        height: 2,
                        color: Colors.pink[200],
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(100),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Hero(
                          tag: member.avatarUrl,
                          child: Material(
                            shape: const CircleBorder(),
                            elevation: 8.0,
                            child: ClipOval(
                              child: Image.network(member.avatarUrl,fit: BoxFit.cover,),
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              _buildInfo('拼音', member.pinyin),
              _buildInfo('加入所属', member.pname),
              _buildInfo('昵称', member.nickname),
              _buildInfo('加入日期', member.join_day),
              _buildInfo('身高', '${member.height} cm'),
              _buildInfo('生日', member.birth_day),
              _buildInfo('星座', member.star_sign_12),
              _buildInfo('出生地', member.birth_place),
              _buildInfo('特长', member.speciality),
              _buildInfo('兴趣爱好', member.hobby),
            ]
          )),
        ],
      ),
    );
  }

  _buildInfo(String label, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(label),
            Text(content,textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}
