import 'package:flutter/material.dart';
import 'confirm_page.dart';

const bg = Color(0xFFF6E8EA);
const bar = Color(0xFFF4E3E6);
const brown = Color(0xFF8C6E6E);

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});
  @override
  State<ReportForm> createState() => _ReportFormState();
}enum ReportType { lost, found }


class _ReportFormState extends State<ReportForm> {
    ReportType reportType = ReportType.lost;

  final titleC = TextEditingController();
  final locationC = TextEditingController();
  final timeC = TextEditingController();
  final dateC = TextEditingController();
  final descC = TextEditingController();
  String? category;

  bool get canSubmit {
    return titleC.text.trim().isNotEmpty &&
        (category ?? '').trim().isNotEmpty &&
        locationC.text.trim().isNotEmpty &&
        timeC.text.trim().isNotEmpty &&
        dateC.text.trim().isNotEmpty &&
        descC.text.trim().isNotEmpty;
  }

  @override
  void dispose() {
    titleC.dispose();
    locationC.dispose();
    timeC.dispose();
    dateC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 72,
            decoration: const BoxDecoration(
              color: bar,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
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
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    const Text('بلاغ عثور'),
    Radio<ReportType>(
      value: ReportType.found,
      groupValue: reportType,
      onChanged: null,
      activeColor: brown,
    ),
    const SizedBox(width: 12),
    const Text('بلاغ مفقود'),
    Radio<ReportType>(
      value: ReportType.lost,
      groupValue: reportType,
      onChanged: (v) => setState(() => reportType = v!),
      activeColor: brown,
    ),
  ],
)
,
              const SizedBox(height: 10),
              _label('نوع العنوان:'),
              _field(
                child: TextField(
                  controller: titleC,
                  onChanged: (_) => setState(() {}),
                  decoration: _dec(),
                ),
              ),
              _label('التصنيف:'),
              _field(
                child: DropdownButtonFormField<String>(
                  decoration: _dec(),
                  value: category,
                  items: const [
                    DropdownMenuItem(value: 'مفاتيح', child: Text('مفاتيح')),
                    DropdownMenuItem(value: 'بطاقة', child: Text('بطاقة')),
                    DropdownMenuItem(value: 'جوال', child: Text('جوال')),
                  ],
                  onChanged: (v) {
                    category = v;
                    setState(() {});
                  },
                ),
              ),
              _label('الموقع:'),
              _field(
                child: TextField(
                  controller: locationC,
                  onChanged: (_) => setState(() {}),
                  decoration: _dec(icon: Icons.location_on_outlined),
                ),
              ),
              _label('التاريخ والوقت:'),
              Row(
                children: [
                  Expanded(
                    child: _field(
                      child: TextField(
                        controller: timeC,
                        readOnly: true,
                        decoration: _dec(icon: Icons.access_time, hint: '00:00'),
                        onTap: () async {
                          final t = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (t != null) setState(() => timeC.text = t.format(context));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _field(
                      child: TextField(
                        controller: dateC,
                        readOnly: true,
                        decoration: _dec(icon: Icons.calendar_month, hint: 'DD/MM/YYYY'),
                        onTap: () async {
                          final d = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (d != null) {
                            setState(() => dateC.text = '${d.day}/${d.month}/${d.year}');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              _label('وصف البلاغ:'),
              _field(
                min: 130,
                child: TextField(
                  controller: descC,
                  maxLines: 6,
                  onChanged: (_) => setState(() {}),
                  decoration: _dec(),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: canSubmit
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brown,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ConfirmPage(
                                data: {
                                  'type': 'مفقود',
                                  'title': titleC.text.trim(),
                                  'category': (category ?? '').trim(),
                                  'location': locationC.text.trim(),
                                  'date': dateC.text.trim(),
                                  'time': timeC.text.trim(),
                                  'desc': descC.text.trim(),
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text('تقديم البلاغ'),
                      )
                    : OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: brown),
                          foregroundColor: brown,
                        ),
                        onPressed: null,
                        child: const Text('تقديم البلاغ'),
                      ),
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field({required Widget child, double min = 48}) => Container(
        constraints: BoxConstraints(minHeight: min),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF4DDE1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: brown),
        ),
        child: child,
      );

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(right: 6, top: 8, bottom: 6),
        child: Text(t, style: const TextStyle(color: brown)),
      );

  InputDecoration _dec({IconData? icon, String hint = ''}) => InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon, color: brown),
        hintText: hint,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      );
}
