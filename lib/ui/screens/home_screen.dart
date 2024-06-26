import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controllers/home_screen_controller.dart';
import 'package:app/ui/components/todo_item.dart';
import 'package:app/ui/routing.dart';
import 'package:app/utils/priority.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          return ListView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Text(
                  'Today Tasks',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Priorities',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ...Priority.values.map(
                      (priority) => Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: priority.color,
                            ),
                          ),
                          Text(priority.displayText),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ...controller.homeList.map(
                (todo) => TodoItem(
                  todoWithStatis: todo,
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.toNamed(MRouting.todoEdit)),
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
