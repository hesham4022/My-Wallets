import 'package:first_task/cubits/cubit/add_card_cubit/add_card_cubit.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/custom_button.dart';
import 'package:first_task/custom_widget/custom_widget_of_homePage/custom_text_field.dart';
import 'package:first_task/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCardForm extends StatefulWidget {
  const AddCardForm({super.key});

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? bank, cardNumber, amount;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: "اسم البنك",
            onSaved: (value) {
              bank = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: "رقم البطاقة",
            onSaved: (value) {
              cardNumber = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: "الرصيد",
            onSaved: (value) {
              amount = value;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddCardCubit, AddCardState>(
            builder: (context, state) {
              return CustomButton(
                isLaoding: state is AddCardLaoding,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final card = CardModel(
                      bank: bank!,
                      cardNumber: cardNumber!,
                      amount: double.tryParse(amount!) ?? 0.0,
                      color: context.read<AddCardCubit>().color.value,
                    );

                    BlocProvider.of<AddCardCubit>(context).addNote(card);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
