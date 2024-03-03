import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../cards/recent_course_card.dart';


class RecentCourseList extends StatefulWidget {
  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  //Definir una lista para los indicadores
  List<Container> indicators = [];
  int currentPage = 0;

  //Funcion para actualizar los indicador y regresa un solo widget
  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map((course) {
        var index = recentCourses.indexOf(course);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          //Para hacer una lista desplegable
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: currentPage == index ? 1.0 : 0.5,
                child: RecentCourseCard(
                  course: recentCourses[index],
                ),
              );
            },
            //todos los elementos de recentCourses
            itemCount: recentCourses.length,
            //Controlador para definir donde empieza
            controller: PageController(initialPage: 0, viewportFraction: 0.63),
            onPageChanged: (index) {
              //funcion para actualizar la ui en respesta a un cambio de estado interno
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}