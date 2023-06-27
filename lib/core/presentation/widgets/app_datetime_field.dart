import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/core/domain/formatter/app_formatter.dart';

class AppDateTimeField extends StatefulWidget {
  final String labelText;
  final DateTime startDate;
  final DateTime endDate;
  final ValueChanged<DateTime?>? onChanged;
  final DateFormat format;

  final DateTime? Function() getInitValueFunc;

  const AppDateTimeField(
      {Key? key,
      required this.labelText,
      required this.startDate,
      required this.endDate,
      required this.onChanged,
      required this.format,
      required this.getInitValueFunc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AppDateTimeFieldState();
}

class AppDateTimeFieldState extends State<AppDateTimeField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text =
        DateTimeField.tryFormat(widget.getInitValueFunc(), widget.format);
  }

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      resetIcon: const Icon(Icons.calendar_month),
      controller: controller,
      format: DateFormat.yMd(AppFormatter.currentLocale(context)),
      onChanged: widget.onChanged,
      onShowPicker: (context, currentValue) {
        var initValue = widget.getInitValueFunc();
        return showDatePicker(
            context: context,
            firstDate: widget.startDate,
            initialDate: initValue ?? DateTime.now(),
            lastDate: widget.endDate);
      },
    );
  }

  void change(DateTime dateTime, BuildContext context) {
    controller.text = DateTimeField.tryFormat(
        dateTime, DateFormat.yMd(AppFormatter.currentLocale(context)));
  }
}
