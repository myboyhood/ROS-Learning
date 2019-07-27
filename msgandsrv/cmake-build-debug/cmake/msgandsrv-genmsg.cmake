# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "msgandsrv: 1 messages, 1 services")

set(MSG_I_FLAGS "-Imsgandsrv:/home/user/catkin_ws/src/msgandsrv/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(msgandsrv_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_custom_target(_msgandsrv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "msgandsrv" "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_custom_target(_msgandsrv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "msgandsrv" "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/msgandsrv
)

### Generating Services
_generate_srv_cpp(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/msgandsrv
)

### Generating Module File
_generate_module_cpp(msgandsrv
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/msgandsrv
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(msgandsrv_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(msgandsrv_generate_messages msgandsrv_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_dependencies(msgandsrv_generate_messages_cpp _msgandsrv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_dependencies(msgandsrv_generate_messages_cpp _msgandsrv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(msgandsrv_gencpp)
add_dependencies(msgandsrv_gencpp msgandsrv_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS msgandsrv_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/msgandsrv
)

### Generating Services
_generate_srv_eus(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/msgandsrv
)

### Generating Module File
_generate_module_eus(msgandsrv
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/msgandsrv
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(msgandsrv_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(msgandsrv_generate_messages msgandsrv_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_dependencies(msgandsrv_generate_messages_eus _msgandsrv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_dependencies(msgandsrv_generate_messages_eus _msgandsrv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(msgandsrv_geneus)
add_dependencies(msgandsrv_geneus msgandsrv_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS msgandsrv_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/msgandsrv
)

### Generating Services
_generate_srv_lisp(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/msgandsrv
)

### Generating Module File
_generate_module_lisp(msgandsrv
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/msgandsrv
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(msgandsrv_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(msgandsrv_generate_messages msgandsrv_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_dependencies(msgandsrv_generate_messages_lisp _msgandsrv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_dependencies(msgandsrv_generate_messages_lisp _msgandsrv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(msgandsrv_genlisp)
add_dependencies(msgandsrv_genlisp msgandsrv_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS msgandsrv_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/msgandsrv
)

### Generating Services
_generate_srv_nodejs(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/msgandsrv
)

### Generating Module File
_generate_module_nodejs(msgandsrv
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/msgandsrv
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(msgandsrv_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(msgandsrv_generate_messages msgandsrv_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_dependencies(msgandsrv_generate_messages_nodejs _msgandsrv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_dependencies(msgandsrv_generate_messages_nodejs _msgandsrv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(msgandsrv_gennodejs)
add_dependencies(msgandsrv_gennodejs msgandsrv_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS msgandsrv_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv
)

### Generating Services
_generate_srv_py(msgandsrv
  "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv
)

### Generating Module File
_generate_module_py(msgandsrv
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(msgandsrv_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(msgandsrv_generate_messages msgandsrv_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/msg/Num.msg" NAME_WE)
add_dependencies(msgandsrv_generate_messages_py _msgandsrv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/catkin_ws/src/msgandsrv/srv/Srv_test.srv" NAME_WE)
add_dependencies(msgandsrv_generate_messages_py _msgandsrv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(msgandsrv_genpy)
add_dependencies(msgandsrv_genpy msgandsrv_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS msgandsrv_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/msgandsrv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/msgandsrv
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(msgandsrv_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/msgandsrv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/msgandsrv
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(msgandsrv_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/msgandsrv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/msgandsrv
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(msgandsrv_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/msgandsrv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/msgandsrv
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(msgandsrv_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/msgandsrv
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(msgandsrv_generate_messages_py std_msgs_generate_messages_py)
endif()
