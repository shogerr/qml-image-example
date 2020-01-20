cmake_minimum_required(VERSION 3.15)

if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "")
endif()

message("$ENV{VCPKG_TARGET_TRIPLET}")

if(NOT DEFINED ENV{VCPKG_TARGET_TRIPLET})
  set(VCPKG_TARGET_TRIPLET "\"x64-windows\"")
endif()

project(image-editor CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(OpenCV CONFIG REQUIRED)
find_package(Qt5 COMPONENTS Core Widgets Quick REQUIRED)

set(SOURCE
    src/main.cpp
    src/image_item.cpp
    src/workspace.cpp
    )

set(FORMS
    qml/main.qml
    qml/CanvasFrame.qml
    )

add_executable(${PROJECT_NAME}
    ${SOURCE}
    ${FORMS}
    qml/qml.qrc
    test.qrc
    )

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        CXX_STANDARD 17
    )

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${OpenCV_INCLUDE_DIRS}
    )

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        ${OpenCV_LIBS}
        Qt5::Core
        Qt5::Widgets
        Qt5::Quick
    )
