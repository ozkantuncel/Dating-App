import 'package:dating_app/features/image_upload/presentation/bloc/image_upload_page_bloc.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:dating_app/resources/dimens.dart';
import 'package:dating_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';

class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<UploadPhotoPageBloc, UploadPhotoPageState>(
        listener: (context, state) {
          if (state is UploadPhotoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is UploadPhotoSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Fotoğraf başarıyla yüklendi'),
                backgroundColor: Colors.green,
              ),
            );
            context.push(AppRoutes.home);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                const Text(
                  'Fotoğraflarınızı Yükleyin',
                  style: TextStyle(
                    color: ColorName.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Resources out incentivize relaxation floor loss cc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorName.gray70, fontSize: 16),
                ),
                const SizedBox(height: 32),
                if (state is UploadPhotoLoading)
                  const Padding(
                    padding: EdgeInsets.all(Dimens.paddingMedium2),
                    child: SizedBox(
                      width: Dimens.iconSizeMedium * 1.5,
                      height: Dimens.iconSizeMedium * 1.5,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballSpinFadeLoader,
                        colors: [ColorName.nileBlue],
                      ),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () => context.read<UploadPhotoPageBloc>().add(
                      UploadPhotoRequested(),
                    ),
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Color(0xFF2C2C2E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.grey, size: 40),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
