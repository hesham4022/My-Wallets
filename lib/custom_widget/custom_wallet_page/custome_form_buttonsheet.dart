import 'package:first_task/cubits/cubit/addwallet/addwallet_cubit.dart';
import 'package:first_task/models/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletFormBottomSheet extends StatefulWidget {
  final WalletModel? model;
  final void Function(WalletModel updatedModel) onSubmit;

  const WalletFormBottomSheet({super.key, this.model, required this.onSubmit});

  @override
  State<WalletFormBottomSheet> createState() => _WalletFormBottomSheetState();
}

class _WalletFormBottomSheetState extends State<WalletFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController amountController;
  late TextEditingController createdAtController;
  late TextEditingController walletTypeController;
  late TextEditingController progressController;

  @override
  void initState() {
    super.initState();
    final m = widget.model;

    nameController = TextEditingController(text: m?.name ?? '');
    amountController = TextEditingController(text: m?.amount.toString() ?? '');
    createdAtController = TextEditingController(text: m?.createdAt ?? '');
    walletTypeController = TextEditingController(text: m?.walletType ?? '');
    progressController =
        TextEditingController(text: m?.progress.toString() ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    createdAtController.dispose();
    walletTypeController.dispose();
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(controller: nameController, label: 'Name'),
              _buildTextField(
                  controller: amountController,
                  label: 'Amount',
                  keyboardType: TextInputType.number),
              _buildTextField(
                  controller: createdAtController, label: 'Created At'),
              _buildTextField(
                  controller: walletTypeController, label: 'Wallet Type'),
              _buildTextField(
                  controller: progressController,
                  label: 'Progress (%)',
                  keyboardType: TextInputType.number),
              SizedBox(height: 20),
              BlocBuilder<AddwalletCubit, AddwalletState>(
                builder: (context, state) {
                  if (state is AddWalletLaoding) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final updatedModel = WalletModel(
                          name: nameController.text.trim().isEmpty
                              ? 'بدون اسم'
                              : nameController.text.trim(),
                          amount: double.tryParse(amountController.text) ?? 0.0,
                          createdAt: createdAtController.text.trim().isEmpty
                              ? 'غير محدد'
                              : createdAtController.text.trim(),
                          walletType: walletTypeController.text.trim().isEmpty
                              ? 'غير محدد'
                              : walletTypeController.text.trim(),
                          progress:
                              double.tryParse(progressController.text) ?? 0.0,
                          colorValue:
                              widget.model?.colorValue ?? Colors.blue.value,
                        );

                        context.read<AddwalletCubit>().addWallet(updatedModel);

                        widget.onSubmit(
                            updatedModel); // 💡 استدعاء التحديث من الخارج

                        Navigator.pop(context);
                      }
                    },
                    child: Text('حفظ'),
                  );
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => value == null || value.isEmpty ? 'مطلوب' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
