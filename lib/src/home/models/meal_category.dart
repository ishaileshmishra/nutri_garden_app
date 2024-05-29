class MealCategory {
  final String strCategory;

  MealCategory({required this.strCategory});

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      strCategory: json['strCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strCategory': strCategory,
    };
  }
}
