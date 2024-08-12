import 'dart:io';

void main() {
  List<String> members = [];
  Map<String, List<String>> memberWorkouts = {};
  Map<String, int> attendance = {};

  while (true) {
    print('\n  Welcome To Iron Fitness');
    print('1. Add Member');
    print('2. View Members');
    print('3. Assign Workout Plan');
    print('4. Mark Attendance');
    print('5. Exit');

    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addMember(members);
        break;
      case '2':
        viewMembers(members);
        break;
      case '3':
        assignWorkoutPlan(members, memberWorkouts);
        break;
      case '4':
        markAttendance(members, attendance);
        break;
      case '5':
        exit(0);
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void addMember(List<String> members) {
  stdout.write('Enter member name: ');
  String? name = stdin.readLineSync();

  if (name != null && name.isNotEmpty) {
    members.add(name);
    print('Member added successfully.');
  } else {
    print('Invalid input. Member not added.');
  }
}

void viewMembers(List<String> members) {
  print('\nList of Members:');
  for (var member in members) {
    print('- $member');
  }
}

void assignWorkoutPlan(
    List<String> members, Map<String, List<String>> memberWorkouts) {
  stdout.write('Enter member name to assign workout plan: ');
  String? memberName = stdin.readLineSync();

  if (memberName != null && members.contains(memberName)) {
    stdout.write('Enter workout plan: ');
    String? workoutPlan = stdin.readLineSync();

    if (workoutPlan != null && workoutPlan.isNotEmpty) {
      memberWorkouts.putIfAbsent(memberName, () => []).add(workoutPlan);
      print('Workout plan assigned successfully.');
    } else {
      print('Invalid workout plan.');
    }
  } else {
    print('Member not found.');
  }
}

void markAttendance(List<String> members, Map<String, int> attendance) {
  stdout.write('Enter member name to mark attendance: ');
  String? memberName = stdin.readLineSync();

  if (memberName != null && members.contains(memberName)) {
    attendance[memberName] = (attendance[memberName] ?? 0) + 1;
    print('Attendance marked for $memberName.');
  } else {
    print('Member not found.');
  }
}
