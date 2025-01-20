// ignore_for_file: public_member_api_docs, sort_constructors_first
class SneakerModel {
  String? label;
  double? price;
  String? imagePath;
  SneakerModel({
    this.label,
    this.price,
    this.imagePath,
  });

  String priceStr() => _checkDecimal(price);
  String _checkDecimal(double? value) {
    if (value == null) {
      return "";
    }

    bool hasDecimal = value != value.truncate();

    return hasDecimal ? value.toStringAsFixed(2) : value.toInt().toString();
  }
}

class SneakerDetailModel extends SneakerModel {
  String? brand;
  String? sku;
  List<ColorWay>? colors;
  List<double>? sizes;
  SneakerDetailModel({
    super.label,
    super.price,
    super.imagePath,
    this.brand,
    this.sku,
    this.colors,
    this.sizes,
  });

  String sizeStr(double size) => super._checkDecimal(size);
}

class ColorWay {
  String? label;
  String? imagePath;
  ColorWay({
    this.label,
    this.imagePath,
  });
}
