import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracking/features/progress/presentation/manager/progress_cubit.dart';
import 'package:habit_tracking/features/progress/presentation/widgets/time_period_button.dart';

class TimePeriodContainer  extends StatelessWidget {
  const TimePeriodContainer ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height *0.08,
      decoration: const BoxDecoration(
        color: Colors.grey
      ),
     
      child:  BlocBuilder< ProgressCubit , ProgressType>(
        builder: (context, progressType) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimePeriodButton(buttonText: "Weekly", 
            onPressed: () {context.read<ProgressCubit>().showWeeklyProgress(); }, 
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: progressType == ProgressType.weekly ? Colors.purple : Colors.white
            ),),
            
            TimePeriodButton(buttonText: "Monthly", 
            onPressed: () {context.read<ProgressCubit>().showMmonthlyProgress();  }, 
            buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: progressType == ProgressType.monthly ? const Color.fromARGB(255, 13, 167, 21) : Colors.white

            ),),
            
            TimePeriodButton(buttonText: "Yearly", 
            onPressed: () { context.read<ProgressCubit>().showYearlyProgress(); }, 
            buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: progressType == ProgressType.yearly ? Colors.purple : Colors.white

            ),)
        
             ],
          
        );
          
        },
        
        
        
        ) ,
    );
  }
}