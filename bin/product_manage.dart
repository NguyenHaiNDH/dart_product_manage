import 'dart:io';
import '../lib/inventory.dart';
import '../lib/exception.dart';

void main() {
  print('---- Quản lý kho hàng ---');
  while (true) {
    stdout.write('\n Nhập lênh (withdraw/restock/exit): ');
    String? command = stdin.readLineSync();

    if (command == 'exit') break;

    stdout.write('Nhập tên sản phẩm: ');
    String? product = stdin.readLineSync();

    stdout.write('Nhập số lượng: ');
    String? quantityInput = stdin.readLineSync();
    int? quantity = int.tryParse(quantityInput ?? '');

    try{
      if(product == null || quantity == null) {
        throw ArgumentError('Thông tin không hợp lệ.');
      }

      if (command == 'withdraw') {
        withdraw(product, quantity);
      } else if (command == 'restock') {
        restock(product, quantity);
      } else {
        print('Lệnh không hợp lệ.');
      }
    } on OutOfStockExcepstion catch (e) {
      print('Lỗi: ${e.message}');
    } on ArgumentError catch (e){
      print('Lỗi: ${e.message}');
     }
    on FormatException catch (e) {
      print('Lỗi: ${e.message}');
    }   
    catch (e) {
      print('Lỗi không xác định: $e');
    } finally {
      print('hiện trạng kho: $inventory');
    }
  }
  print('Chương trình kết thúc.');
}