import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../calendar/data/model/visit_model.dart';

class MyCalendarDataSource extends CalendarDataSource{
  final List<VisitModel> visits;
  MyCalendarDataSource({required this.visits}) {
    appointments=visits;
  }

  @override
  Object? getId(int index){
    return visits[index].id;
  }

  @override
  String getSubject(int index) {
    return visits[index].title;
  }

  @override
  DateTime getStartTime(int index) {
    return visits[index].visitDate;
  }

  @override
  DateTime getEndTime(int index) {
    return visits[index].visitDate;
  }
}