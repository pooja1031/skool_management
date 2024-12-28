import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skool_management/widgets/themes/colors/app_colors.dart';

class AttendancePage extends StatefulWidget {
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime selectedDate = DateTime.now();

  List<int> _generateYears() {
    int currentYear = DateTime.now().year;
    return List.generate(30, (index) => currentYear - index);
  }

  List<String> _getMonths() {
    return List.generate(12, (index) => 
      DateFormat('MMMM').format(DateTime(2024, index + 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF006D77),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Logo', style: TextStyle(color: Colors.white)),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('MMMM yyyy').format(selectedDate),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Circular Progress Indicator
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.grey.shade200,
                    color: const Color(0xFF006D77),
                    strokeWidth: 10,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      '75 %',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Present in april 2024',
                      style: TextStyle(
                        color: Color(0xFF006D77),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Working Days Text
            const Text(
              'Total Working Days: 20/30',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            
            // Status Cards
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text(
                            '15 Days',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'overall Present this month',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Text(
                            '5 Days',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'overall Absent this month',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
           
          ],
        ),
      ),
    );
  }

  


}