ifndef GIT_HOME
$(error Variable GIT_HOME is not set)
endif
ifndef DART_HOME
$(error Variable DART_HOME is not set)
endif
ifndef MSYS_HOME
$(error Variable MSYS_HOME is not set)
endif

ifeq ($(OS),Windows_NT)
DART       = $(subst \,/,$(DART_HOME))/bin/dart.exe
HOME       = $(subst \,/,$(USERPROFILE))
LOCAL_REPO = $(subst \,/,$(USERPROFILE))/.m2/repository
PSEP       = ;
## $(MSYS_HOME)\usr\bin\{cp.exe, make.exe, wget.exe}
CP         = /usr/bin/cp.exe
CURL       = /usr/bin/curl.exe
ECHO       = /usr/bin/echo.exe
FIND       = /usr/bin/find.exe
MAKE       = /usr/bin/make.exe
MKDIR      = /usr/bin/mkdir.exe
RM         = /usr/bin/rm.exe
TOUCH      = /usr/bin/touch.exe
else
DART       = dart
LOCAL_REPO = $(HOME)/.m2/repository
PSEP       = :
CP         = cp
CURL       = curl
ECHO       = echo
FIND       = find
MAKE       = make
MKDIR      = mkdir
RM         = rm
TOUCH      = touch
endif
