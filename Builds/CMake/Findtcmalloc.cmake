# - Try to find tcmalloc
# Once done this will define
#  TCMALLOC_FOUND - System has tcmalloc
#  TCMALLOC_LIBRARIES - The libraries needed to use tcmalloc

if(NOT USE_BUNDLED_TCMALLOC)
  find_package(PkgConfig)
  if (PKG_CONFIG_FOUND)
    pkg_check_modules(PC_TCMALLOC QUIET tcmalloc)
  endif()
else()
  set(PC_TCMALLOC_LIBDIR)
  set(PC_TCMALLOC_LIBRARY_DIRS)
  set(LIMIT_SEARCH NO_DEFAULT_PATH)
endif()

set(TCMALLOC_DEFINITIONS ${PC_TCMALLOC_CFLAGS_OTHER})

list(APPEND TCMALLOC_NAMES tcmalloc)

find_library(TCMALLOC_LIBRARY NAMES ${TCMALLOC_NAMES}
  HINTS ${PC_TCMALLOC_LIBDIR} ${PC_TCMALLOC_LIBRARY_DIRS}
  ${LIMIT_SEARCH})

set(TCMALLOC_LIBRARIES ${TCMALLOC_LIBRARY})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set TCMALLOC_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(TcMalloc DEFAULT_MSG
  TCMALLOC_LIBRARY)

mark_as_advanced(TCMALLOC_LIBRARY)
