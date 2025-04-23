class OutOfStockExcepstion implements Exception {
    final String message;
    OutOfStockExcepstion(this.message);

    @override
    String toString() => 'OutOfStockExcepstion: $message';
}