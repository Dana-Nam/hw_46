class UserData {
  final String gender;
  final int age;
  final int height;
  final int weight;
  final double activity;
  final double goalMultiplier;

  UserData({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.activity,
    required this.goalMultiplier,
  });

  double get bmr {
    if (gender == 'male') {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double get tdee {
    return bmr * activity * goalMultiplier;
  }
}
