import 'package:flutter/material.dart';

final String tableHabits = 'habit';

class HabitFields {
  static final List<String> values = [
    /// Add all fields
    id, name, description, numRepetitions, interval, color, createdTime
  ];
  static final String id = '_id';
  static final String name = 'name';
  static final String description = 'description';
  static final String numRepetitions = 'numRepetitions';
  static final String interval = 'interval';
  static final String color = 'color';
  static final String createdTime = 'createdTime';
}

class Habit {
  final int? id;
  final String habitName;
  final String description;
  final int numRepetitions;
  final int interval;
  final Color color;
  final DateTime createdTime;

  const Habit({
    this.id,
    required this.habitName,
    required this.description,
    required this.numRepetitions,
    required this.interval,
    required this.color,
    required this.createdTime,
  });

  Habit copy(
          {int? id,
          String? habitName,
          String? description,
          int? numRepetitions,
          int? interval,
          Color? color,
          DateTime? createdTime}) =>
      Habit(
          id: id ?? this.id,
          habitName: habitName ?? this.habitName,
          description: description ?? this.description,
          numRepetitions: numRepetitions ?? this.numRepetitions,
          interval: interval ?? this.interval,
          color: color ?? this.color,
          createdTime: createdTime ?? this.createdTime);

  static Habit fromJson(Map<String, Object?> json) => Habit(
        id: json[HabitFields.id] as int?,
        habitName: json[HabitFields.name] as String,
        description: json[HabitFields.description] as String,
        numRepetitions: json[HabitFields.numRepetitions] as int,
        interval: json[HabitFields.interval] as int,
        color: json[HabitFields.color] as Color,
        createdTime: DateTime.parse(json[HabitFields.createdTime] as String),
      );

  Map<String, Object?> toJson() => {
        HabitFields.id: id,
        HabitFields.name: habitName,
        HabitFields.description: description,
        HabitFields.numRepetitions: numRepetitions,
        HabitFields.interval: interval,
        HabitFields.color: color,
        HabitFields.createdTime: createdTime.toIso8601String(),
      };
}
