import 'package:dentister/core/main_data/cubit/main_cubit.dart';
import 'package:dentister/core/main_data/cubit/main_state.dart';
import 'package:dentister/core/utils/variables.dart';
import 'package:dentister/features/calendar/data/model/visit_model.dart';
import 'package:dentister/features/home/presentation/views/widgets/appointment_widget.dart';
import 'package:dentister/features/home/presentation/views/widgets/my_calendar_data_source.dart';
import 'package:dentister/features/patient_section/data/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendar extends StatelessWidget {
  const MyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit,MainState>(
        builder: (context,state) {
          if (state is MainStateSuccess){
            List<PatientModel> patients = state.data['patients'];
            List<VisitModel> visits = state.data['visits'];
            return SfCalendar(
              initialSelectedDate: Variables.selectedCalendarDate?? DateTime.now(),
              onTap: (calendarDetails){
                Variables.selectedCalendarDate= calendarDetails.date;
              },
              view: CalendarView.month,
              showDatePickerButton: true,
              timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 0,
                endHour: 24,
                nonWorkingDays: [],
                timeInterval: Duration(hours: 1),
                dayFormat: 'EEE',
                timeFormat: 'h a',
              ),
              firstDayOfWeek: DateTime.saturday,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
                // appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
              ),
              appointmentBuilder: (context,appointmentDetail){
                final VisitModel visit = appointmentDetail.appointments.first;
                return AppointmentWidget(
                  patient: patients.firstWhere((patient)=>patient.id==visit.patientId),
                  visit: visit
                );
              },
              dataSource: MyCalendarDataSource(visits: visits),
              allowAppointmentResize: true,
              allowViewNavigation: true,
              showTodayButton: true,


            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }

        }
    );
  }
}