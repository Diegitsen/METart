import 'package:flutter/cupertino.dart';

import '../../../models/department.dart'; 
import 'department_card.dart';

/*
class DepartmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.44,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
      itemCount: 21,
      itemBuilder: (context, index) => DepartmentCard(
        categories[index],
        onPress: () => Navigator.of(context).pushNamed("/pokedex"),
      ),
    );
  }
}*/