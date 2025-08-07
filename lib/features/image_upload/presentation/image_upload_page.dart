
import 'package:dating_app/features/image_upload/presentation/widgets/image_upload_page_view.dart';
import 'package:dating_app/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:dating_app/resources/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/image_upload_page_bloc.dart';

class UploadPhotoPage extends StatelessWidget {
  const UploadPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.black,
      appBar: CustomAppBar(
        onPressed: () {},
        title: "Profil Detay",
        isProfile: false,
      ),
      body: BlocProvider(
        create: (context) => UploadPhotoPageBloc(),
        child: UploadPhotoView(),
      ),
    );
  }
}
