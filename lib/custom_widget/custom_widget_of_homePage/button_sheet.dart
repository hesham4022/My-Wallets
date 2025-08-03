import 'package:first_task/cubits/cubit/add_card_cubit/add_card_cubit.dart';

import 'package:first_task/cubits/cubit/card_cubit/card_cubit.dart';

import 'package:first_task/custom_widget/custom_widget_of_homePage/add_card_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBottomsheet extends StatelessWidget {
  const AddBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCardCubit(),
      child: BlocConsumer<AddCardCubit, AddCardState>(
        listener: (context, state) {
          if (state is AddCardSuccess) {
            context.read<CardCubit>().fetchAllCards();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddCardLaoding,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddCardForm(),
            ),
          );
        },
      ),
    );
  }
}
