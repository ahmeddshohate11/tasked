import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tasked/firebase_utils.dart';
import 'package:tasked/home/task_list/task_list_item.dart';
import 'package:tasked/model/task.dart';
import 'package:tasked/provider/list_provider.dart';

class TaskListTab extends StatelessWidget {
  Task task;
  List<Task> tasks = [];

  TaskListTab({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
     if (listProvider.tasks.isEmpty) {
      listProvider.getAllTasksFromFireStore(
        
      );
    }
    return Column(
      children: [
        SlidableAction(onPressed: (context){
          // delete task
        
         FirebaseUtils.deleteTaskFromFireStore(task).timeout(const Duration(seconds: 1),
         onTimeout: (){
          print('delete task timeout');
          listProvider.getAllTasksFromFireStore();
         }
         );
        },icon: Icons.delete,label: 'Delete',backgroundColor:Colors.red ),
        EasyDateTimeLine(
          initialDate: listProvider.selectedDate,
          
          onDateChange: (date) {
            // التاريخ المختار
            listProvider.changeSelectedDate(date);
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
                  colors: [Color(0xff3371FF), Color(0xff8426D6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskListItem(
                listProvider.tasks[index],
              );
            },
            itemCount: listProvider.tasks.length,
          ),
        ),
      ],
    );
  }
}

// هنا بجيب الداتا من الفاير بيزا
