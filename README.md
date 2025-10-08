# 🧪 BlocLabs - Flutter BLoC Pattern Showcase

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-FF6B35?style=for-the-badge&logo=flutter&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white)
![HTTP](https://img.shields.io/badge/HTTP-009688?style=for-the-badge&logo=http&logoColor=white)
![Freezed](https://img.shields.io/badge/Freezed-4CAF50?style=for-the-badge&logo=dart&logoColor=white)

A comprehensive Flutter project demonstrating various **BLoC (Business Logic Component)** patterns and state management techniques. This repository serves as a complete learning resource and reference implementation for Flutter developers looking to master BLoC architecture with real-world examples.

## 🎯 Project Overview

BlocLabs is a multi-feature Flutter application that showcases different aspects of BLoC pattern implementation, from basic counter functionality to complex API integrations and native device features. Each module is designed to demonstrate specific BLoC concepts and best practices with **clean architecture** principles.

## 🚀 Features & Modules

| 🎨 Feature | 📝 Description | 🎓 Learning Focus | 🔧 Key Technologies |
|------------|----------------|-------------------|-------------------|
| 🔐 **Authentication** | Login form with real API integration | Form validation, HTTP requests, Error handling | `http`, `flutter_bloc`, API integration |
| ➕ **Counter App** | Simple increment/decrement counter | Basic BLoC implementation, Event handling | Core BLoC pattern, State management |
| ❤️ **Favorites Manager** | Interactive item selection with favorites | Complex state handling, List operations | Repository pattern, Multi-selection |
| 📡 **API Integration** | Fetch and display posts from REST API | HTTP requests, JSON parsing, Loading states | `http`, Repository pattern, Error handling |
| 🔍 **Filter & Search** | Real-time filtering of API data | Data manipulation, Search functionality | Stream handling, Data filtering |
| 🖼️ **Image Picker** | Camera capture & gallery selection | Native device integration | `image_picker`, File handling |
| 🎚️ **Slider & Switch** | Interactive UI controls with reactive state | Multiple BLoC providers, UI state sync | Multi-BLoC architecture |
| ✅ **Todo Manager** | Add/remove tasks with dynamic list | List management, CRUD operations | Dynamic list handling |
| ⚖️ **Equatable Demo** | Object comparison demonstration | Equatable package usage, Performance | `equatable`, Object equality |
| 🧊 **Freezed Demo** | Code generation with Freezed package | Immutable classes, JSON serialization | `freezed`, Code generation |
| 🏛️ **Clean Architecture** | Advanced BLoC with clean architecture | Dependency injection, Repository pattern | `get_it`, Clean architecture |

## 🏗️ Architecture & Project Structure

### 📁 Complete Folder Structure
```
lib/
├── 🔐 authentication_app/
│   ├── bloc/ (LoginBloc, Events, States)
│   └── ui/ (LoginScreen)
├── ➕ counter_app/
│   ├── bloc/ (CounterBloc, Events, States)
│   └── ui/ (CounterScreen)
├── ❤️ favourite_app/
│   ├── bloc/ (FavouriteBloc, Events, States)
│   ├── model/ (FavouriteItemModel)
│   ├── repository/ (FavouriteRepository)
│   └── ui/ (FavouriteAppScreen)
├── 📡 get_api_demo/
│   ├── bloc/ (PostsBloc, Events, States)
│   ├── model/ (PostModel)
│   ├── repository/ (PostRepository)
│   ├── utils/ (Enums)
│   └── ui/ (PostsScreen)
├── 🔍 filter_api_list_demo/
│   ├── bloc/ (FilterPostsBloc, Events, States)
│   ├── model/ (FilterPostModel)
│   ├── repository/ (FilterPostRepository)
│   ├── utils/ (Enums)
│   └── ui/ (FilterPostsScreen)
├── 🖼️ image_picker_demo/
│   ├── bloc/ (ImagePickerBloc, Events, States)
│   ├── utils/ (ImagePickerUtils)
│   └── ui/ (ImagePickerScreen)
├── 🎚️ slider_and_switch_demo/
│   ├── bloc/
│   │   ├── slider/ (SliderBloc, Events, States)
│   │   └── switch/ (SwitchBloc, Events, States)
│   └── ui/ (SliderAndSwitchScreen)
├── ✅ todo_app/
│   ├── bloc/ (TodoBloc, Events, States)
│   └── ui/ (TodoScreen)
├── ⚖️ equatable_demo/
│   └── equatable_demo.dart
├── 🧊 freezed_package_demo/
│   ├── model/
│   │   ├── animal/ (AnimalModel with Freezed)
│   │   └── person_model.dart
│   └── ui/ (FreezedPackageDemo)
├── 🏛️ bloc_pattern_architecture/
│   ├── bloc/
│   │   ├── login/ (LoginBloc, Events, States)
│   │   └── movie/ (MovieBloc, Events, States)
│   ├── config/
│   │   ├── color/ (AppColors)
│   │   ├── components/ (Reusable Widgets)
│   │   ├── data/
│   │   │   ├── exceptions/ (AppExceptions)
│   │   │   ├── network/ (NetworkServices)
│   │   │   └── response/ (ApiResponse)
│   │   └── routes/ (AppRoutes, RoutesName)
│   ├── models/
│   │   ├── movie/ (Movie with Freezed)
│   │   ├── shows/ (Shows with Freezed)
│   │   └── user/ (UserModel with Freezed)
│   ├── repository/
│   │   ├── auth/ (LoginRepository)
│   │   └── movie/ (MovieRepository)
│   ├── services/
│   │   ├── session_manager/ (SessionController)
│   │   ├── splash/ (SplashServices)
│   │   └── storage/ (LocalStorage)
│   ├── utils/ (Enums, Validations, FlushBarHelper)
│   └── views/
│       ├── home/ (HomeScreen)
│       ├── login/ (LoginScreen + Widgets)
│       └── splash/ (SplashScreen)
└── main.dart
```

## 🔧 Core Components & Implementation

### 🎯 **1. Counter App - Basic BLoC Pattern**

**Event-Driven Architecture:**
```dart
// Events
abstract class CounterEvent extends Equatable {}
class IncrementCounter extends CounterEvent {}
class DecrementCounter extends CounterEvent {}

// State
class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 0});
  
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);
  }

  void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
```

**UI Integration:**
```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Text("${state.counter}", style: TextStyle(fontSize: 60));
  },
)
```

### 🔐 **2. Authentication - Form Validation & API Integration**

**Real-time Form Validation:**
```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginAPI>(_onLoginAPI);
  }

  void _onLoginAPI(LoginAPI event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': state.email, 'password': state.password},
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        emit(state.copyWith(
          message: "Login Successfully : ${data['token']}", 
          status: LoginStatus.success
        ));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
```

### 📡 **3. API Integration - Repository Pattern**

**Repository Implementation:**
```dart
class PostRepository {
  Future<List<PostModel>> onFetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final posts = json.decode(response.body) as List;
      return posts.map((e) => PostModel.fromJson(e)).toList();
    }
    throw Exception("Error on fetching posts");
  }
}
```

**BLoC with Repository:**
```dart
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository repo = PostRepository();

  PostsBloc() : super(const PostsState()) {
    on<PostsFetched>(onFetchPosts);
    add(PostsFetched()); // Auto-fetch on initialization
  }

  Future<void> onFetchPosts(PostsFetched event, Emitter<PostsState> emit) async {
    await repo.onFetchPosts()
        .then((value) => emit(state.copyWith(
            status: PostsStatus.success, 
            posts: value
        )))
        .catchError((error) => emit(state.copyWith(
            status: PostsStatus.failure, 
            message: error.toString()
        )));
  }
}
```

### 🖼️ **4. Image Picker - Native Device Integration**

**Utility Class:**
```dart
class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> onCameraCapture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> onPickFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
```

**BLoC Implementation:**
```dart
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
}
```

### 🧊 **5. Freezed Package - Code Generation**

**Immutable Model with Freezed:**
```dart
@freezed
abstract class AnimalModel with _$AnimalModel {
  const factory AnimalModel({
    @Default('') String name, 
    @Default(0) int age, 
    @Default([]) List<String> petName
  }) = _AnimalModel;

  factory AnimalModel.fromJson(Map<String, dynamic> json) => 
      _$AnimalModelFromJson(json);
}
```

**Benefits:**
- ✅ **Immutability** by default
- ✅ **copyWith()** method generation
- ✅ **JSON serialization** support
- ✅ **Equality comparison** built-in
- ✅ **toString()** implementation

### 🏛️ **6. Clean Architecture Implementation**

**Dependency Injection with GetIt:**
```dart
GetIt getIt = GetIt.instance;

void servicesLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpAPIRepository());
  getIt.registerLazySingleton<MovieRepository>(() => MovieHttpAPIRepository());
}
```

**Repository Abstraction:**
```dart
abstract class LoginRepository {
  Future<UserModel> onLoginAPI(dynamic credential);
}

class LoginHttpAPIRepository implements LoginRepository {
  @override
  Future<UserModel> onLoginAPI(credential) async {
    // HTTP implementation
  }
}

class LoginMockAPIRepository implements LoginRepository {
  @override
  Future<UserModel> onLoginAPI(credential) async {
    // Mock implementation for testing
  }
}
```

## 🎨 App Flow & Visual Interactions

### 📱 **Main App Navigation Flow**

```
🚀 Splash Screen
    ↓
🏠 Home Screen (Route-based navigation)
    ↓
📋 Feature Selection
    ├── ➕ Counter App
    ├── 🔐 Authentication
    ├── 📡 API Demo
    ├── 🖼️ Image Picker
    ├── 🎚️ Slider & Switch
    ├── ✅ Todo Manager
    ├── ❤️ Favorites
    ├── 🔍 Filter Demo
    ├── ⚖️ Equatable Demo
    └── 🧊 Freezed Demo
```

### 🔄 **State Management Patterns**

#### **Single BLoC Provider:**
```dart
BlocProvider(
  create: (context) => CounterBloc(),
  child: CounterScreen(),
)
```

#### **Multiple BLoC Providers:**
```dart
MultiBlocProvider(
  providers: [
    BlocProvider<SwitchBloc>(create: (context) => SwitchBloc()),
    BlocProvider<SliderBloc>(create: (context) => SliderBloc()),
    BlocProvider<ImagePickerBloc>(create: (context) => ImagePickerBloc(ImagePickerUtils())),
    BlocProvider<ToDoBloc>(create: (context) => ToDoBloc()),
    BlocProvider<FavouriteBloc>(create: (context) => FavouriteBloc(FavouriteRepository())),
  ],
  child: MaterialApp(/* ... */),
)
```

### 🎯 **User Interaction Flows**

#### **Counter App Flow:**
```
User taps "+" button → IncrementCounter event → BLoC processes → State updated → UI rebuilds
User taps "-" button → DecrementCounter event → BLoC processes → State updated → UI rebuilds
```

#### **Authentication Flow:**
```
User types email → EmailChanged event → State updated → Real-time validation
User types password → PasswordChanged event → State updated → Real-time validation
User taps Login → LoginAPI event → Loading state → API call → Success/Error state → UI feedback
```

#### **Image Picker Flow:**
```
User taps camera icon → CameraCapture event → Native camera opens → Image selected → State updated → Image displayed
User taps gallery icon → GalleryImagePicker event → Native gallery opens → Image selected → State updated → Image displayed
```

## 🔧 Technical Implementation Details

### 📦 **Dependencies Used**

```yaml
dependencies:
  flutter_bloc: ^9.1.1      # State management
  bloc: ^9.0.1              # Core BLoC library
  equatable: ^2.0.7         # Object comparison
  http: ^1.5.0              # HTTP requests
  image_picker: ^1.2.0      # Native image selection
  get_it: ^8.2.0            # Dependency injection
  freezed_annotation: ^3.1.0 # Freezed annotations
  json_annotation: ^4.9.0   # JSON annotations
  fluttertoast: ^9.0.0      # Toast messages
  cached_network_image: ^3.4.1 # Image caching
  another_flushbar: ^1.12.32 # Custom notifications
  flutter_secure_storage: ^9.2.4 # Secure storage
  google_fonts: ^6.3.2     # Custom fonts

dev_dependencies:
  build_runner: ^2.9.0      # Code generation
  freezed: ^3.2.3           # Immutable classes
  json_serializable: ^6.11.1 # JSON serialization
```

### 🎨 **App Theme & UI**

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true, 
    brightness: Brightness.dark
  ),
  // Dark theme with Material 3 design
)
```

### 📊 **State Management Patterns Comparison**

| Pattern | Use Case | Complexity | Performance |
|---------|----------|------------|-------------|
| **Single BLoC** | Simple features (Counter) | ⭐ Low | ⚡ Fast |
| **Multiple BLoCs** | Complex UI (Slider + Switch) | ⭐⭐ Medium | ⚡⚡ Good |
| **Repository Pattern** | API Integration | ⭐⭐⭐ High | ⚡⚡⚡ Excellent |
| **Clean Architecture** | Enterprise Apps | ⭐⭐⭐⭐ Very High | ⚡⚡⚡⚡ Outstanding |

### 🔄 **BLoC Event Handling Patterns**

#### **Immediate Response:**
```dart
on<IncrementCounter>((event, emit) {
  emit(state.copyWith(counter: state.counter + 1));
});
```

#### **Async Operations:**
```dart
on<LoginAPI>((event, emit) async {
  emit(state.copyWith(status: LoginStatus.loading));
  try {
    final result = await repository.login(credentials);
    emit(state.copyWith(status: LoginStatus.success, user: result));
  } catch (e) {
    emit(state.copyWith(status: LoginStatus.error, message: e.toString()));
  }
});
```

#### **Conditional State Updates:**
```dart
on<PostsFetched>((event, emit) async {
  if (state.status == PostsStatus.loading) return;
  
  emit(state.copyWith(status: PostsStatus.loading));
  // ... fetch logic
});
```

## 🎓 **Learning Outcomes**

By exploring this project, developers will master:

- ✅ **Core BLoC Concepts**: Events, States, and BLoC classes
- ✅ **State Management**: Single and multiple BLoC providers
- ✅ **API Integration**: HTTP requests with proper error handling
- ✅ **Form Validation**: Real-time validation with BLoC
- ✅ **Native Features**: Camera and gallery integration
- ✅ **Code Generation**: Freezed and JSON serialization
- ✅ **Clean Architecture**: Repository pattern and dependency injection
- ✅ **Performance Optimization**: Equatable and efficient rebuilds
- ✅ **Error Handling**: Comprehensive error management
- ✅ **Testing Patterns**: Mock repositories and testable architecture

## 🚀 **Advanced Features**

### 🔒 **Session Management**
```dart
class SessionController {
  static final SessionController _instance = SessionController._internal();
  factory SessionController() => _instance;
  
  Future<void> saveUserInPreference(UserModel user) async {
    // Secure storage implementation
  }
  
  Future<UserModel?> getUserFromPreference() async {
    // Retrieve user data
  }
}
```

### 🌐 **Network Layer**
```dart
abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url, dynamic data);
}

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    // HTTP GET implementation with error handling
  }
}
```

### 🎨 **Custom Components**
- **LoadingWidget**: Reusable loading indicators
- **RoundButton**: Consistent button styling
- **InternetException**: Network error handling
- **FlushBarHelper**: Custom notification system

This project serves as a **complete reference** for Flutter developers looking to implement robust, scalable, and maintainable applications using the BLoC pattern with modern Flutter development practices.