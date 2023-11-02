import 'package:chat_app/models/models_model.dart';
import 'package:chat_app/services/api_service.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier{
  
  String currentModel = "text-davinci-003";
  String get getModelsList{
    return currentModel;
  }

  void setCurrentModel(String newModel){
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];

  List<ModelsModel> get getCurrentModel{
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels () async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}