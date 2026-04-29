import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseView<VM extends ViewModel> extends StatelessWidget {
  // Variables

  final VM viewModel;

  // Constructor

  const BaseView(this.viewModel, {super.key});

  // Public methods

  @protected
  Widget buildView(BuildContext context);

  // Build

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    if (!viewModel.initialized) viewModel.onStart();
    return ChangeNotifierProvider<VM>(
      create: (_) => viewModel,
      child: Consumer<VM>(
        builder: (BuildContext context, VM vm, Widget? _) {
          return Material(child: buildView(context));
        },
      ),
    );
  }
}
