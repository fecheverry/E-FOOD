import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  int _hours = 0;
  int _minutes = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 212, 209, 209),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(0), // reducir el padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPickerColumn(
              range: 24,
              value: _hours,
              onChange: (value) {
                setState(() {
                  _hours = value;
                });
              },
            ),
            _buildPickerColumn(
              range: 60,
              value: _minutes,
              onChange: (value) {
                setState(() {
                  _minutes = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerColumn({
    required int range,
    required int value,
    required void Function(int) onChange,
  }) {
    return Container(
      height: 120, // reducir la altura del contenedor del ListWheelScrollView
      width: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 209, 209),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: ListWheelScrollView(
        itemExtent: 35,
        physics: const FixedExtentScrollPhysics(),
        children: List.generate(
          range,
          (index) => Center(
            child: Text(
              index.toString().padLeft(2, '0'),
              style: TextStyle(
                color: index == value
                    ? const Color.fromARGB(255, 82, 212, 87)
                    : Colors.black,
                fontWeight:
                    index == value ? FontWeight.bold : FontWeight.normal,
                fontSize: 25,
              ),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          onChange(index);
        },
      ),
    );
  }

  TimeOfDay get selectedTime {
    return TimeOfDay(hour: _hours, minute: _minutes);
  }
}
