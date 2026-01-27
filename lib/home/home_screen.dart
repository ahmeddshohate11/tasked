import 'package:flutter/material.dart';
import 'package:tasked/home/settings/settings_tab.dart';
import 'package:tasked/home/task_list/add_task_bottom_sheet.dart';
import 'package:tasked/home/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';


  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
               body:selectedIndex==0? TaskListTab(
        task: null!,
               ):SettingsTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
         selectedIndex=index;
         setState(() {
           
         });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Task List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTaskBottomSheet();
        }, 
      child: Icon(Icons.add,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
   
  void showAddTaskBottomSheet() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const AddTaskBottomSheet(),
  );
}
}
