import 'package:flutter/material.dart';
import 'package:qa3a_owner/features/reservations/presentation/widget/reservation_card.dart';

class ReservationListCard extends StatelessWidget {
  const ReservationListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ReservationCard(
          hallName: 'قاعة الأفراح الكبرى',
          customerName: 'أحمد محمد أحمد',
          phone: '01000000000',
          date: '2025-12-10',
          time: '9:00 - 17:00',
          price: '10,000 ج.م',
          status: 'مؤكد',
          category: 'زفاف',
          statusColor: Color(0xFF34C38F),
        ),
        ReservationCard(
          hallName: 'قاعة المؤتمرات الكبرى',
          customerName: 'أحمد محمد أحمد',
          phone: '01000000000',
          date: '2025-12-10',
          time: '9:00 - 17:00',
          price: '10,000 ج.م',
          status: 'قيد الانتظار',
          category: 'مؤتمر',
          statusColor: Color(0xFFF1B44C),
        ),
        ReservationCard(
          hallName: 'قاعة المناسبات',
          customerName: 'أحمد محمد أحمد',
          phone: '01000000000',
          date: '2025-12-10',
          time: '9:00 - 17:00',
          price: '10,000 ج.م',
          status: 'ملغى',
          category: 'زفاف',
          statusColor: Color(0xFFF46A6A),
        ),
      ],
    );
  }
}