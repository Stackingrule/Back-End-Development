# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\Users\intje\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\193.6494.38\bin\cmake\win\bin\cmake.exe

# The command to remove a file.
RM = C:\Users\intje\AppData\Local\JetBrains\Toolbox\apps\CLion\ch-0\193.6494.38\bin\cmake\win\bin\cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\C++Server\EasyTcpServer-1.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\C++Server\EasyTcpServer-1.1\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/EasyTcpServer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/EasyTcpServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/EasyTcpServer.dir/flags.make

CMakeFiles/EasyTcpServer.dir/server.cpp.obj: CMakeFiles/EasyTcpServer.dir/flags.make
CMakeFiles/EasyTcpServer.dir/server.cpp.obj: ../server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\C++Server\EasyTcpServer-1.1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/EasyTcpServer.dir/server.cpp.obj"
	C:\TDM-GCC-64\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\EasyTcpServer.dir\server.cpp.obj -c E:\C++Server\EasyTcpServer-1.1\server.cpp

CMakeFiles/EasyTcpServer.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/EasyTcpServer.dir/server.cpp.i"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E E:\C++Server\EasyTcpServer-1.1\server.cpp > CMakeFiles\EasyTcpServer.dir\server.cpp.i

CMakeFiles/EasyTcpServer.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/EasyTcpServer.dir/server.cpp.s"
	C:\TDM-GCC-64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S E:\C++Server\EasyTcpServer-1.1\server.cpp -o CMakeFiles\EasyTcpServer.dir\server.cpp.s

# Object files for target EasyTcpServer
EasyTcpServer_OBJECTS = \
"CMakeFiles/EasyTcpServer.dir/server.cpp.obj"

# External object files for target EasyTcpServer
EasyTcpServer_EXTERNAL_OBJECTS =

EasyTcpServer.exe: CMakeFiles/EasyTcpServer.dir/server.cpp.obj
EasyTcpServer.exe: CMakeFiles/EasyTcpServer.dir/build.make
EasyTcpServer.exe: CMakeFiles/EasyTcpServer.dir/linklibs.rsp
EasyTcpServer.exe: CMakeFiles/EasyTcpServer.dir/objects1.rsp
EasyTcpServer.exe: CMakeFiles/EasyTcpServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\C++Server\EasyTcpServer-1.1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable EasyTcpServer.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\EasyTcpServer.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/EasyTcpServer.dir/build: EasyTcpServer.exe

.PHONY : CMakeFiles/EasyTcpServer.dir/build

CMakeFiles/EasyTcpServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\EasyTcpServer.dir\cmake_clean.cmake
.PHONY : CMakeFiles/EasyTcpServer.dir/clean

CMakeFiles/EasyTcpServer.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\C++Server\EasyTcpServer-1.1 E:\C++Server\EasyTcpServer-1.1 E:\C++Server\EasyTcpServer-1.1\cmake-build-debug E:\C++Server\EasyTcpServer-1.1\cmake-build-debug E:\C++Server\EasyTcpServer-1.1\cmake-build-debug\CMakeFiles\EasyTcpServer.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/EasyTcpServer.dir/depend

