class Order {
  final String id;
  final String customerName;
  final String items;

  Order({required this.id, required this.customerName, required this.items});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customer_name'],
      items: json['items'],
    );
  }
}
