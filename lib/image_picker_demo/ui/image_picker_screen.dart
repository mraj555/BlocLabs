import 'dart:io';

import 'package:bloclabs/image_picker_demo/bloc/image_picker_bloc.dart';
import 'package:bloclabs/image_picker_demo/bloc/image_picker_event.dart';
import 'package:bloclabs/image_picker_demo/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Image Picker Demo"), centerTitle: true),
        body: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return state.image == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => context.read<ImagePickerBloc>().add(CameraCapture()),
                          child: CircleAvatar(child: Icon(Icons.camera)),
                        ),
                        SizedBox(width: 30),
                        InkWell(
                          onTap: () => context.read<ImagePickerBloc>().add(GalleryImagePicker()),
                          child: CircleAvatar(child: Icon(Icons.photo_library_rounded)),
                        ),
                      ],
                    )
                  : Image.file(File(state.image!.path));
            },
          ),
        ),
      ),
    );
  }
}
