import 'package:flutter/material.dart';
import 'package:tasked/firebase_utils.dart';
import 'package:tasked/model/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey=GlobalKey<FormState>();
  String title='';
  String description='';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Add new Task', style: Theme.of(context).textTheme.titleMedium),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onChanged: (val){
                    title=val;
                    setState(() {
                      
                    });
                  },
                  decoration: InputDecoration(hintText: 'Entre task title'),
                    validator: (text){
                    if(text == null||text.isEmpty){
                      return 'Please entre task tittle';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (val){
                    description=val;
                    setState(() {
                      
                    });
                  },
                  validator: (text){
                    if(text == null||text.isEmpty){
                      return 'Please entre task Description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Entre task Description',
                  ),
                  maxLines: 4,
                ),
                Text(
                  'Select Date',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      showCalander();
                    },
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year }',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
void addTask() {
    if(formKey.currentState?.validate() == false){
      ///add task to fire base
      Task task=Task(
        title: title,
        description: description,
        dateTime: selectedDate,
      );
      FirebaseUtils.addTaskToFireStore(task).then((value) {
        Navigator.pop(context);
      } );
    }
  }
  void showCalander() async {
    var chooseDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 356)),
    );
    if(chooseDate !=null){
      selectedDate=chooseDate;
      setState(() {
        
      });
    }
    // selectedDate=chooseDate ?? selectedDate;
  }
}
