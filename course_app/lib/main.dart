import 'package:flutter/material.dart';
import 'components/homescreennavbar.dart';
import 'components/lists/recentcourselist.dart';
import 'constants.dart';
import 'model/course.dart';
import 'model/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recents",
                        style: kLargeTitleStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "23 courses, more coming",
                        style: kSubtitleStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RecentCourseList(),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Explore",
                        style: kTitle1Style,
                      ),
                    ],
                  ),
                ),
                ExploreCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ExploreCourseCard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {
  ExploreCourseCard({required this.course});

  final Course course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Row(children: [
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
            course.courseSubtitle.toString(),
            style: kCardSubtitleStyle,
          ),
          SizedBox(height: 6.0),
          Text(
            course.courseTitle.toString(),
            style: kCardTitleStyle,
          )
                ],
              ),
              
              ),
Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Image.asset('asset/illustrations/${course.illustration}',
    fit: BoxFit.cover, height: 100.0,)
  ],
)
            ]),
          ),
        ),
      ),
    );
  }
}
//Asi se llama un componente
// RecentCourseCard(course:recentCourses[0])

//SideBar
class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 21.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sai Kambampati",
                      style: kHeadlineLabelStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "License ends on 21 Jan, 2021",
                      style: kSearchPlaceholderStyle,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SidebarRow(
              item: SidebarItem.sidebarItems[0],
            ),
            const SizedBox(
              height: 32.0,
            ),
            SidebarRow(
              item: SidebarItem.sidebarItems[1],
            ),
            const SizedBox(
              height: 32.0,
            ),
            SidebarRow(
              item: SidebarItem.sidebarItems[2],
            ),
            const SizedBox(
              height: 32.0,
            ),
            SidebarRow(
              item: SidebarItem.sidebarItems[3],
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/icons/icon-logout.png',
                  width: 17.0,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Log out",
                  style: kSecondaryCalloutLabelStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//SideBar Options
class SidebarRow extends StatelessWidget {
  SidebarRow({required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.0,
          height: 42.0,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              gradient: item.background),
          child: item.icon,
        ),
        const SizedBox(width: 12),
        Container(
          child: Text(
            item.title.toString(),
            style: kCalloutLabelStyle,
          ),
        ),
      ],
    );
  }
}
