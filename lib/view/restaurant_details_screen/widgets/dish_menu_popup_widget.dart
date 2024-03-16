import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/controller/home/restaurant_details_controller.dart';

import '../../../model/restaurant/recipe_category_model.dart';
import '../../../utils/constants/colors.dart';
import 'dish_menu_button.dart';

class DishMenuPopupWidget extends StatefulWidget {
  const DishMenuPopupWidget({
    super.key,
    required this.tabContext,
    required this.restaurantDetailsController,
  });
  final BuildContext tabContext;
  final RestaurantDetailsController restaurantDetailsController;
  @override
  State<DishMenuPopupWidget> createState() => _DishMenuPopupWidgetState();
}

class _DishMenuPopupWidgetState extends State<DishMenuPopupWidget> {
  bool closed = true;

  List<RecipeCategoryModel> get recipeCategoryModelList =>
      widget.restaurantDetailsController.recipeCategoryModelList;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 20)).then(
      (value) {
        setState(() {
          closed = false;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // print('pop invoked : $didPop');
        if (didPop) {
          return;
        }
        popDialog();
      },
      child: Material(
        color: Colors.black.withOpacity(0.3),
        child: GestureDetector(
          onTap: () {
            // print('Gesture invoked :');
            popDialog();
          },
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSlide(
                offset: Offset(closed ? 1 : 0, 0),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: GestureDetector(
                  onTap: () {
                    // print('Container Gesture invoked :');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      clipBehavior: Clip.antiAlias,
                      child: Material(
                        color: Colors.transparent,
                        child: Ink(
                            decoration: BoxDecoration(
                              color: ColorConstants.primaryWhite,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.75,
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: recipeCategoryModelList.length,
                                itemBuilder: (context, index) {
                                  RecipeCategoryModel item =
                                      recipeCategoryModelList[index];
                                  return InkWell(
                                    onTap: () {
                                      popDialog(index: index);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: DefaultTextStyle(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: DefaultTabController.of(
                                                                widget
                                                                    .tabContext)
                                                            .index ==
                                                        index
                                                    ? ColorConstants
                                                        .primaryColor
                                                    : null),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child:
                                                    Text(item.categoryTitle)),
                                            Text('${item.dishList.length}')
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              DishMenuButton(
                onTap: () {
                  popDialog();
                },
                closed: false,
              ),
              const SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }

  void popDialog({int? index}) {
    setState(() {
      closed = true;
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        if (context.mounted) {
          Navigator.pop(context, index);
        }
      });
    });
  }
}
