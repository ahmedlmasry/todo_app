import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_pp/layout/cubit/cubit.dart';
import 'package:todo_pp/layout/cubit/states.dart';
import 'package:todo_pp/modules/new-tasks.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return ConditionalBuilder(
            condition: tasks.length > 0,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) =>
                    buildTaskItem(tasks[index], context),
                separatorBuilder: (context, index) => Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                itemCount: tasks.length),
            fallback: (BuildContext context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.menu,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Tasks Yet, Please Add Some Tasks',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ));
      },
    );
  }
}
