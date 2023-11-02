import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/models_model.dart';
import 'package:chat_app/services/api_service.dart';
import 'package:chat_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ModelsDrownDownWidget extends StatefulWidget {
  const ModelsDrownDownWidget({super.key});

  @override
  State<ModelsDrownDownWidget> createState() => _ModelsDrownDownWidget();
} 

class _ModelsDrownDownWidget extends State<ModelsDrownDownWidget>{
  String currentModel = "text-davinci-003";
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<ModelsModel>>(
      future: ApiService.getModels(),
      builder: (context, snapshot){
        if (snapshot.hasError){
          return Center(child: TextWidget(label: snapshot.error.toString())
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty 
        ? const SizedBox.shrink()
        : FittedBox(
          child: DropdownButton(
            dropdownColor: scaffoldBackgroundColor,
            iconEnabledColor: Colors.white,
            items: List<DropdownMenuItem<String>>.generate(
              snapshot.data!.length, 
              (index) => DropdownMenuItem(
                value: snapshot.data![index].id,
                child: TextWidget(
                  label: snapshot.data![index].id, 
                  fontSize: 15,)
              ),
            ),
            value: currentModel,
            onChanged: (value){
              setState(() {
                currentModel = value.toString();
              });
            },
          ),
        );
      }
    );
  }
}
// class _ModelsDrownDownWidget extends State<ModelsDrownDownWidget>{
//   String currentModel = "Model1";
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       
//     );
//   }
// }