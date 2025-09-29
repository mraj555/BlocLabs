import 'package:bloc/bloc.dart';
import 'package:bloclabs/image_picker_demo/bloc/image_picker_event.dart';
import 'package:bloclabs/image_picker_demo/bloc/image_picker_state.dart';
import 'package:bloclabs/image_picker_demo/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils utils;

  ImagePickerBloc(this.utils) : super(ImagePickerState()) {
    on<CameraCapture>(_onCameraCapture);
    on<GalleryImagePicker>(_onGalleryImagePicker);
  }

  Future<void> _onCameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await utils.onCameraCapture();
    emit(state.copyWith(image: file));
  }

  Future<void> _onGalleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await utils.onPickFromGallery();
    emit(state.copyWith(image: file));
  }
}
