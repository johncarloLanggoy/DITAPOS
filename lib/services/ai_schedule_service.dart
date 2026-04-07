import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/task_model.dart';
import '../models/schedule_analysis.dart';


class AiScheduleService extends ChangeNotifier {

  ScheduleAnalysis? _currentAnalysis;
  bool _isLoading = false;
  String? _errorMessage;

  final String _apiKey = '';

  Future<void> analyzeSchedule(List<TaskModel> tasks) async{

    if(_apiKey.isEmpty || tasks.isEmpty) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final model = GenerativeModel(model: 'gemini-2.2-flash', apiKey: _apiKey);
      final tasksJson = jsonEncode(tasks.map((t) => t.toJson()).toList());
      final prompt = '''
      
      You are an expert student assistant. The user ha provided the following tasks for their day in JSON format: $tasksJson
      
      Your job is to analyze these task, identify any onerlaps or conflicts in their start and end suggest a better balance schedule.
      consider their urgency, importance, and required energy level.
      
      1. ### Detected Conflicts
      List any Scheduling conflicts
      
      2. Ranked Tasks
      Rank which task need attention first based on the urgency, importance and energy. Provide a brief reason on each.
      
      ''';


    } catch (e) {
    finally {

    }
  }
  }


}