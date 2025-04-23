import 'exception.dart';

Map<String, int> inventory = {
  'apple': 58,
  'banana': 6,
  'orange': 45,
};

void withdraw(String product, int amount) {
    if(!inventory.containsKey(product)) {
        throw ArgumentError('Sản phẩm không tồn tại trong kho.');
    }
    if (amount <= 0) {
        throw ArgumentError('Số lượng rút phải lớn hơn 0.');
    }
    if (inventory[product]! < amount) {
        throw OutOfStockExcepstion('Sản phẩm $product không đủ số lượng trong kho.');
    }

    inventory[product] = inventory[product]! - amount;
    print('đã rút $amount $product ra khỏi kho.');
    print('Số lượng còn lại: ${inventory[product]}');

}

void restock(String product, int amount) {
    if (amount <= 0) {
        throw ArgumentError('Số lượng nhập phải lớn hơn 0');
    }

    inventory[product] = (inventory[product] ?? 0) + amount;
    print('đã nhập $amount $product vào kho.');
    print('Số lượng hiện tại: ${inventory[product]}');
}