class RecipeModal {
  late String applabel;
  late String appimgurl;
  late double appcalories;
  late String appurl;

  RecipeModal(
      {this.applabel = "Label",
      this.appcalories = 0.00,
      this.appimgurl = "image",
      this.appurl = "url"});

  factory RecipeModal.fromMap(Map recipe) {
    return RecipeModal(
      applabel: recipe["label"],
      appcalories: recipe["calories"],
      appimgurl: recipe["image"],
      appurl: recipe["url"],
    );
  }
}
