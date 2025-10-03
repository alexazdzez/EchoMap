class SettingsModel {
  final String? floor;
  final String? corridor;
  final bool? hasToilets;

  SettingsModel({this.floor, this.corridor, this.hasToilets});

  Map<String, dynamic> toMap() {
    return {
      'floor': floor,
      'corridor': corridor,
      'hasToilets': hasToilets,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      floor: map['floor'],
      corridor: map['corridor'],
      hasToilets: map['hasToilets'],
    );
  }
}
