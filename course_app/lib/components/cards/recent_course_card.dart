import '../../model/course.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
//Card Widget
class RecentCourseCard extends StatelessWidget {
  //Buscar el porque de las sgtes dos lineas
  RecentCourseCard({required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 240, height: 240,
            decoration: BoxDecoration(
              gradient: course.background,
              borderRadius: BorderRadius.circular(41.0),
              boxShadow:[
                BoxShadow(
                  color: course.background!.colors[0].withOpacity(0.3),
                  offset: Offset(0,20),
                  blurRadius: 30.0
                ),
                BoxShadow(
                  color: course.background!.colors[1].withOpacity(0.3),
                  offset: Offset(0,20),
                  blurRadius: 30.0
                )
              ],
            ),
            child: Column(children: [
              Padding(padding: EdgeInsets.only(top: 32.0, left:32.0,right: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.courseSubtitle.toString(),
                    style: kCardSubtitleStyle,
                  ),
                  SizedBox(height: 6.0,),
                  Text(
                    course.courseTitle.toString(),
                    style: kCardSubtitleStyle,
                  ),
                ],
              ),
              
              ),
              Expanded(child: 
              Image.asset(
                'asset/illustrations/${course.illustration}',
                fit: BoxFit.cover
              ),)
            ],)
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 42.0),
        child: Container(
          child: Image.asset('asset/logos/${course.logo}'),
          width: 60.0, height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0,4),
                blurRadius: 16.0,
              )
            ]
          ),
          padding: EdgeInsets.all(12.0),
        ),
        )
      ],
    );
  }
}
