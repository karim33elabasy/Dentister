import 'package:dentister/core/utils/methods.dart';
import 'package:dentister/core/widgets/my_tff.dart';
import 'package:dentister/core/widgets/patient_circle_avatar.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_cubit.dart';
import 'package:dentister/features/calendar/presentation/manager/visit_states.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_cubit.dart';
import 'package:dentister/features/patient_section/presentation/manager/show_patients_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/validation.dart';

class VisitBody extends StatelessWidget {
  final bool isEditing;
  const VisitBody({super.key,required this.isEditing});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    VisitCubit visitCubit = BlocProvider.of<VisitCubit>(context);
    ShowPatientsCubit showPatientsCubit = BlocProvider.of<ShowPatientsCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.045,
        vertical: width * 0.05,
      ),
      child: BlocConsumer<VisitCubit,VisitStates>(
        builder: (context,state) {
          return Form(
            key: visitCubit.visitFormKey,
            child: Column(
              children: [
                CheckboxListTile(
                  title: const Text("Did the visit done ?"),
                  value: visitCubit.visitDone,
                  onChanged: (value){
                    visitCubit.visitDone=value!;
                  }
                ),
                SizedBox(height: width*0.05,),
                MyTff(
                  obscureText: false,
                  label: "Visit ID",
                  controller: visitCubit.visitId,
                  maxLines: 1,
                  minLines: 1,
                  enabled: false,
                ),
                MyTff(
                  obscureText: false,
                  label: "Visit Title",
                  controller: visitCubit.visitTitle,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  validator: Validation.validateVisitTitle,
                ),
                MyTff(
                  obscureText: false,
                  label: "Visit Notes",
                  controller: visitCubit.visitNotes,
                  maxLines: 5,
                  minLines: 2,
                  enabled: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: ()async{
                          visitCubit.visitDateDT = await showDatePicker(context: context, firstDate: DateTime(DateTime.now().year-5), lastDate: DateTime(DateTime.now().year+5));
                          if (visitCubit.visitDateDT != null) {
                            visitCubit.visitDate.text =
                            "${visitCubit.visitDateDT!.day}/${visitCubit.visitDateDT!.month}/${visitCubit.visitDateDT!.year}";}
                        },
                        child: AbsorbPointer(
                          child: MyTff(
                            validator: Validation.validateBirthDate,
                            obscureText: false,
                            label: "Visit Date",
                            controller: visitCubit.visitDate,
                            minLines: 1,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.03,),
                    Expanded(
                      child: InkWell(
                        onTap: ()async{
                          visitCubit.visitTimeDT = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (visitCubit.visitTimeDT != null) {
                            visitCubit.visitTime.text =
                            "${visitCubit.visitTimeDT!.hourOfPeriod}:${visitCubit.visitTimeDT!.minute} ${visitCubit.visitTimeDT!.period.name}";}
                        },
                        child: AbsorbPointer(
                          child: MyTff(
                            obscureText: false,
                            label: "Visit Time",
                            controller: visitCubit.visitTime,
                            minLines: 1,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                isEditing?
                 const SizedBox()
                :BlocBuilder<ShowPatientsCubit,ShowPatientsStates>(
                  builder: (context,state) {
                    showPatientsCubit.getPatients();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.03),
                          margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.sizeOf(context).width*0.05
                          ),
                          width: double.infinity,
                          height:MediaQuery.sizeOf(context).height*0.5,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(visitCubit.patient == null? "Click on a patient to choose" :"Patient (${visitCubit.patient!.name}) selected with id:${visitCubit.patient!.id}",style: const TextStyle(color: Colors.deepPurpleAccent),),
                                state is ShowPatientStateSuccess?
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context,counter){
                                    return ListTile(
                                      leading: PatientCircleAvatar(color: state.patients[counter].color,radius: MediaQuery.sizeOf(context).width*0.08),
                                      title: Text(state.patients[counter].name),
                                      subtitle: Text(state.patients[counter].notes),
                                      trailing: visitCubit.patient!=null? state.patients[counter].id==visitCubit.patient!.id? const Icon(Icons.check,color: Colors.green,):null:null,
                                      onTap: (){
                                        visitCubit.choosePatient(state.patients[counter]);
                                      },
                                    );
                                  },
                                  itemCount: state.patients.length,
                                ),
                              ): const Center(child: CircularProgressIndicator(),),
                              MyTff(
                                onChanged: (query){
                                  showPatientsCubit.searchPatients.text=query;
                                  showPatientsCubit.getPatients();
                                },
                                onTap: (){
                                  showPatientsCubit.getPatients();
                                },
                                suffixIcon: IconButton(onPressed: (){showPatientsCubit.searchPatients.text="";}, icon: const Icon(Icons.cancel_outlined)),
                                obscureText: false,
                                bottomPadding: 0,
                                label: "Search Patients",
                                controller: showPatientsCubit.searchPatients,
                                maxLines: 1,
                                minLines: 1,
                              ),
                            ]
                          )
                        )
                      ],
                    );
                  }
                ),
              ],
            ),
          );
        },
        listener: (context,state){
          if (state is VisitStatesFail){
            final SnackBar snackBar = mySnackBar(text: state.error, context: context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is VisitStatesSuccess){
            final SnackBar snackBar = mySnackBar(text: "Visit added with id:${state.id}", context: context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
