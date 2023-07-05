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
## We grab Mingw version instead of C:\Windows\System32\curl.exe
CURL       = $(subst \,/,$(GIT_HOME))/mingw64/bin/curl.exe
ECHO       = $(subst \,/,$(GIT_HOME))/usr/bin/echo.exe
## We grab Mingw version instead of C:\Windows\System32\find.exe
FIND       = $(subst \,/,$(GIT_HOME))/usr/bin/find.exe
MAKE       = $(subst \,/,$(MSYS_HOME))/usr/bin/make.exe
MKDIR      = $(subst \,/,$(GIT_HOME))/usr/bin/mkdir.exe
RM         = $(subst \,/,$(GIT_HOME))/usr/bin/rm.exe
TOUCH      = $(subst \,/,$(GIT_HOME))/usr/bin/touch.exe
else
DART       = dart
LOCAL_REPO = $(HOME)/.m2/repository
PSEP       = :
CURL       = curl
ECHO       = echo
FIND       = find
MAKE       = make
MKDIR      = mkdir
RM         = rm
TOUCH      = touch
endif
