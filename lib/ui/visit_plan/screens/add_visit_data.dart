import 'package:flutter/material.dart';
import 'package:flutter_playground/core/widgets/app_colors.dart';
import 'package:flutter_playground/core/widgets/app_textformfield.dart';
import 'package:flutter_playground/gen/assets.gen.dart';
import 'package:flutter_playground/ui/visit_plan/widget/app_topbar_white.dart';

class AddVisitData extends StatefulWidget {
  const AddVisitData({super.key});

  @override
  State<AddVisitData> createState() => _AddVisitDataState();
}

class _AddVisitDataState extends State<AddVisitData> {
  final _formKey = GlobalKey<FormState>();
  bool labeled = false;
  bool disableButton = true;
  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 12,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(60),
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.textGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // <-- Radius
          ),
        ),
        onPressed: disableButton ? null : () {},
        child: Text(
          "SAVE VISIT DATA",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  Widget _formBody() {
    return SliverToBoxAdapter(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sales Name",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const AppTextFormField(
                      hint: 'Name',
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    AppTextFormField(
                      isLabeled: labeled,
                      hint: 'Visit Date',
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          labeled = true;
                        } else {
                          labeled = false;
                        }
                        setState(() {});
                      },
                      endIcon: Assets.images.icCalendarLarge.image(),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "Time Visit",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              hint: 'Start',
                              readOnlyField: true,
                              endIcon: Assets.images.icTime.image(),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: AppTextFormField(
                              hint: 'End',
                              readOnlyField: true,
                              endIcon: Assets.images.icTime.image(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.softGray,
          body: CustomScrollView(
            slivers: [
              const TopBarWhite(
                title: 'Create Visit Data',
                hasLoading: true,
                loadValue: 50,
              ),
              _formBody(),
            ],
          ),
          floatingActionButton: _saveButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
