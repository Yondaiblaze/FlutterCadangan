# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin tooling to malfunction.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "car_booking_app")
project(${PROJECT_NAME} LANGUAGES CXX)

# The use of CMAKE_SYSTEM_VERSION is specific to the Flutter embedding's
# use of CMake. It is not used by Flutter's build system.
set(CMAKE_SYSTEM_VERSION 10.0)

# Define the application target. To change its name, change PROJECT_NAME above
# and update the call to flutter_set_application_target_name below.
flutter_set_application_target_name(${PROJECT_NAME})

# Define the target's source files.
target_sources(${PROJECT_NAME} PRIVATE
  "runner/main.cpp"
  "runner/flutter_window.cpp"
  "runner/win32_window.cpp"
  "runner/utils.cpp"
  "runner/win32_window.h"
  "runner/flutter_window.h"
  "runner/utils.h"
  "runner/resource.h"
  "runner/Runner.rc"
)

# Define the target's include directories.
target_include_directories(${PROJECT_NAME} PRIVATE
  "runner"
)

# Define the target's compile definitions.
target_compile_definitions(${PROJECT_NAME} PRIVATE
  "NOMINMAX"
  "UNICODE"
  "_UNICODE"
  "WIN32_LEAN_AND_MEAN"
)

# Define the target's compile features.
target_compile_features(${PROJECT_NAME} PRIVATE
  cxx_std_17
)

# Define the target's compile options.
target_compile_options(${PROJECT_NAME} PRIVATE
  /W4 /WX /wd"4100"
  /EHsc
)

# Define the target's link libraries.
target_link_libraries(${PROJECT_NAME} PRIVATE
  flutter
  flutter_windows_app
  dwmapi
  d3d11
  dxgi
  "dwmapi.lib"
  "d3d11.lib"
  "dxgi.lib"
)

# Run the Flutter tool portions of the build. This must not be removed.
flutter_apply_standard_settings(${PROJECT_NAME})
