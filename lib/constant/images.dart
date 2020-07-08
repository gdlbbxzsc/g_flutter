class Ci {
  static const String PATH_IMAGE_ROOT = "assets/images/";
  static const String IMAGE_SUF_PNG = ".png";
  static const String IMAGE_SUF_JPG = ".jpg";

  final String _imgName;

  const Ci(this._imgName);

  String get png1 {
    return _imgName.img.png;
  }

  String get jpg1 {
    return _imgName.img.jpg;
  }

  String get png {
    return PATH_IMAGE_ROOT + _imgName + IMAGE_SUF_PNG;
  }

  String get jpg {
    return PATH_IMAGE_ROOT + _imgName + IMAGE_SUF_JPG;
  }
}

extension StringExt4ImgPath on String {
  String get img {
    return Ci.PATH_IMAGE_ROOT + this;
  }

  String get png {
    return this + Ci.IMAGE_SUF_PNG;
  }

  String get jpg {
    return this + Ci.IMAGE_SUF_JPG;
  }
}
