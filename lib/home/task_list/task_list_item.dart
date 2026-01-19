import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasked/app_colors.dart';
import 'package:tasked/model/task.dart';

class TaskListItem extends StatelessWidget {
   final Task task;
  const TaskListItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
      
        // Specify a key if the Slidable is dismissible.
       
      
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
      extentRatio: 0.25,
      // A motion is a widget used to control how the pane animates.
      motion: const DrawerMotion(),
      
       
      
      // All actions are defined in the children parameter.
      children: const [
        // A SlidableAction can have an icon and/or a label.
        SlidableAction(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          onPressed: null,
          backgroundColor: AppColors.redColor,
      
          foregroundColor: AppColors.whiteColor,
          icon: Icons.delete,
          label: 'Delete',
        ),
        
      ],
        ),
        child: Container(
         
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                width: width * 0.02,
                height: height * 0.1,
                decoration: BoxDecoration(color: AppColors.primaryColor),
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor,fontSize: 22),
                  ),
                  SizedBox(height: 5),
                  Text(
                    task.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium,
                  ),
                ],  
              )),
        
              Container(
                margin: EdgeInsets.all(12),
               padding: EdgeInsets.symmetric(
                  horizontal: 8,
              
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.check, color: Colors.white, size: 30),
                ),
              ),
              // Text(
              //   'Task Title',
              //   style: Theme.of(
              //     context,
              //   ).textTheme.titleMedium?.copyWith(color: Colors.white),
              // ),
              // SizedBox(height: 5),
              // Text(
              //   'Task Description',
              //   style: Theme.of(
              //     context,
              //   ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
