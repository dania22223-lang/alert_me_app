import 'package:flutter/material.dart';

const bg = Color(0xFFF6E8EA);
const bar = Color(0xFFF4E3E6);
const brown = Color(0xFF8C6E6E);

class ConfirmPage extends StatelessWidget {
  final Map<String, String> data;
  const ConfirmPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: _navBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFB68787),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'تفاصيل البلاغ',
                style: TextStyle(fontSize: 28, color: brown, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4DDE1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: brown),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6E8EA),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: brown),
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFB68787),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('تعديل'),
                          ),
                          const Spacer(),
                          const Text(
                            'تفاصيل البلاغ',
                            style: TextStyle(color: brown, fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        children: [
                          _row('نوع البلاغ', data['type'] ?? ''),
                          const SizedBox(height: 10),
                          _row('العنوان', data['title'] ?? ''),
                          const SizedBox(height: 10),
                          _row('التصنيف', data['category'] ?? ''),
                          const SizedBox(height: 10),
                          _row('الموقع', data['location'] ?? ''),
                          const SizedBox(height: 10),
                          _row('التاريخ', data['date'] ?? ''),
                          const SizedBox(height: 10),
                          _row('الوقت', data['time'] ?? ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('تأكيد'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String k, String v) => Row(
        children: [
          Expanded(child: Text(v, textAlign: TextAlign.left)),
          const SizedBox(width: 8),
          Text('$k /', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  Widget _navBar(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 72,
            decoration: const BoxDecoration(
              color: bar,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, -2)),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.settings, color: brown),
                SizedBox(width: 28),
                Icon(Icons.home, color: brown),
                Icon(Icons.description_rounded, color: brown),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 34,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: brown,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 12, spreadRadius: 3)],
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ],
      );
}
