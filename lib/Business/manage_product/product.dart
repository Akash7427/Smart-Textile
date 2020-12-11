import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.uid,
    this.category,
    this.dispatchLoc,
    this.occassion,
    this.sp,
    this.pattern,
    this.fabric,
    this.brand,
    this.width,
    this.subCategory,
    this.work,
    this.secondaryImg,
    this.name,
    this.paymentOptions,
    this.primaryImg,
    this.sleeveType,
    this.use,
    this.sampleOrder,
    this.unitType,
    this.packagingDetails,
    this.material,
    this.setContent,
    this.deliveryTime,
    this.cp,
    this.blouseFabric,
    this.minOrder,
    this.mrp,
    this.size,
    this.stichedType,
    this.supply,
    this.description,
    this.colour,
    this.rating,
    this.sellerAddress,
    this.sellerName,
    this.images,
    this.counter,
  });

  String id;
  String uid;
  String category;
  String dispatchLoc;
  List<String> occassion;
  int sp;
  List<String> pattern;
  List<String> images;
  String fabric;
  String brand;
  String width;
  String subCategory;
  String work;
  List<String> secondaryImg;
  String name;
  String paymentOptions;
  String primaryImg;
  String sleeveType;
  String use;
  String sampleOrder;
  String unitType;
  String packagingDetails;
  String material;
  String setContent;
  String deliveryTime;
  int cp;
  String blouseFabric;
  int minOrder;
  int mrp;
  List<String> size;
  String stichedType;
  String supply;
  String description;
  List<String> colour;
  String sellerName;
  String sellerAddress;
  String rating;
  int counter;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        uid: json["uid"],
        category: json["category"],
        dispatchLoc: json["dispatch_loc"],
        occassion: List<String>.from(json["occassion"].map((x) => x)),
        sp: json["sp"],
        pattern: List<String>.from(json["pattern"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
        fabric: json["fabric"],
        brand: json["brand"],
        width: json["width"],
        subCategory: json["sub_category"],
        work: json["work"],
        secondaryImg: List<String>.from(json["secondary_img"].map((x) => x)),
        name: json["name"],
        paymentOptions: json["payment_options"],
        primaryImg: json["primary_img"],
        sleeveType: json["sleeve_type"],
        use: json["use"],
        sampleOrder: json["sample_order"],
        unitType: json["unit_type"],
        packagingDetails: json["packaging_details"],
        material: json["material"],
        setContent: json["set_content"],
        deliveryTime: json["delivery_time"],
        cp: json["cp"],
        blouseFabric: json["blouse_fabric"],
        minOrder: json["min_order"],
        mrp: json["mrp"],
        size: List<String>.from(json["size"].map((x) => x)),
        stichedType: json["stiched_type"],
        supply: json["supply"],
        description: json["description"],
        colour: List<String>.from(json["colour"].map((x) => x)),
        rating: json["rating"],
        sellerAddress: json["sellerAddress"],
        sellerName: json["sellerName"],
        counter: json["counter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "category": category,
        "dispatch_loc": dispatchLoc,
        "occassion": occassion ?? [],
        "sp": sp,
        "pattern": pattern ?? [],
        "images":images ?? [],
        "fabric": fabric,
        "brand": brand,
        "width": width,
        "sub_category": subCategory,
        "work": work,
        "secondary_img": secondaryImg ?? [],
        "name": name,
        "payment_options": paymentOptions,
        "sleeve_type": sleeveType,
        "use": use,
        "sample_order": sampleOrder,
        "unit_type": unitType,
        "packaging_details": packagingDetails,
        "material": material,
        "set_content": setContent,
        "primary_img": primaryImg,
        "delivery_time": deliveryTime,
        "cp": cp,
        "blouse_fabric": blouseFabric,
        "min_order": minOrder,
        "mrp": mrp,
        "size": size ?? [],
        "stiched_type": stichedType,
        "supply": supply,
        "description": description,
        "colour": colour ?? [],
        "rating": rating ?? "5.0",
        "sellerName": sellerName,
        "sellerAddress": sellerAddress,
      };
}
