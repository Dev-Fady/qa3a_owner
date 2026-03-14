enum BookingStatus { confirmed, pending, cancelled }

class BookingModel {
  final String hallName;
  final String clientName;
  final String company;
  final String date;
  final String time;
  final double price;
  final BookingStatus status;

  const BookingModel({
    required this.hallName,
    required this.clientName,
    required this.company,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
  });
}