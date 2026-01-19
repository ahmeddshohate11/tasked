import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:tasked/home/task_list/task_list_item.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(

      child: Column(
        children: [
          EasyDateTimeLine(
  initialDate: DateTime.now(),
       onDateChange: (date) {
    // التاريخ المختار
  },
  headerProps: const EasyHeaderProps(
    monthPickerType: MonthPickerType.switcher,
    dateFormatter: DateFormatter.fullDateDMY(),
  ),
  dayProps: const EasyDayProps(
    height: 80,
    width: 60,
    dayStructure: DayStructure.dayStrDayNum,
    activeDayStyle: DayStyle(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
        colors: [
          Color(0xff3371FF),
           Color(0xff8426D6)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
    ),
  ),

),
),
       Expanded  (
         child: ListView.builder(itemBuilder: (context, index) {
           return TaskListItem();
         
         },
         itemCount: 10,),
       ),
        ],
      ) 
      , 
    
    );
  }
}
