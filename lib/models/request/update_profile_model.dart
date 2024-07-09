class UpdateProfileModel {
  final String phoneNumber;
  final String position;
  final String department;

  UpdateProfileModel({
    required this.phoneNumber,
    required this.position,
    required this.department,
  });

  UpdateProfileModel copyWith({
    String? phoneNumber,
    String? position,
    String? department,
  }) {
    return UpdateProfileModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      position: position ?? this.position,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'position': position,
      'department': department,
    };
  }

  factory UpdateProfileModel.fromMap(Map<String, dynamic> map) {
    return UpdateProfileModel(
      phoneNumber: map['phoneNumber'],
      position: map['position'],
      department: map['department'],
    );
  }
}
