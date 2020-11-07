import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String ProductTable = "ProductTable";

final String NameColumn = "NameColumn";
final String IdColumn = "IdColumn";
final String PriceColumn = "PriceColumn";
final String ImgColumn = "ImgColumn";

class ProductHelper {

  static final ProductHelper _instace = ProductHelper.internal();

  factory ProductHelper() => _instace;

  ProductHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (db != null) {
      return _db;
    }
    else {
      _db = await initDb();
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();

    final path = join(databasesPath, "produtcsnew.db");

    return await openDatabase(
        path, version: 1, onCreate: (Database db, int newVersion) async {
      await db.execute(
          "CREATE TABLE $ProductTable($IdColumn INTEGER PRIMARY KEY, $NameColumn TEXT, $PriceColumn TEXT, $ImgColumn)");
    });
  }

  Future<Product> saveProdutc(Product product) async {
    Database dbProduct = await db;
    product.id = await dbProduct.insert(ProductTable, product.toMap());
    return product;
  }

  Future<Product> getProduct(int id) async {
    Database dbProduct = await db;
    List<Map> maps = await dbProduct.query(ProductTable,
        columns: [IdColumn, NameColumn, PriceColumn, ImgColumn],
        where: "$IdColumn = ?",
        whereArgs: [id]
    );
    if (maps.length > 0) {
      return Product.fromMap(maps.first);
    }
    else {
      return null;
    }
  }

  Future<int> deleteProduct(int id) async {
    Database dbProduct = await db;
    return await dbProduct.delete(
        ProductTable, where: "$IdColumn = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(Product product) async {
    Database dbProduct = await db;
    return await dbProduct.update(ProductTable,
        product.toMap(),
        where: "$IdColumn = ?",
        whereArgs: [product.id]);
  }


}

class Product {
  int id;
  String Name;
  String Price;
  String Img;

  Product();

  Product.fromMap(Map map) {
    id = map[IdColumn];
    Name = map[NameColumn];
    Price = map[PriceColumn];
    Img = map[ImgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      NameColumn: Name,
      PriceColumn: Price,
      ImgColumn: Img,
    };
    if (id != null) {
      map[IdColumn] = id;
    }
    return map;
  }
  @override
  String toString() {
    return "Product(id: $id, name: $Name, price: $Price, img: $Img";
  }
}