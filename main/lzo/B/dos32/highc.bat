@echo // Copyright (C) 1996-2015 Markus F.X.J. Oberhumer
@echo //
@echo //   DOS 32-bit
@echo //   MetaWare High C/C++ (using Pharlap DOS extender)
@echo //
@call b\prepare.bat
@if "%BECHO%"=="n" echo off


set CC=hc386
set CF=-O3 -w4 %CFI% %CFASM%
set LF=%BLIB%

%CC% %CF% -w1 -c src\*.c
@if errorlevel 1 goto error
386lib %BLIB% -nobanner @b\dos32\highc.rsp
@if errorlevel 1 goto error

%CC% %CF% examples\dict.c %LF%
@if errorlevel 1 goto error
%CC% %CF% examples\lzopack.c %LF%
@if errorlevel 1 goto error
%CC% %CF% examples\precomp.c %LF%
@if errorlevel 1 goto error
%CC% %CF% examples\precomp2.c %LF%
@if errorlevel 1 goto error
%CC% %CF% examples\simple.c %LF%
@if errorlevel 1 goto error

%CC% %CF% lzotest\lzotest.c %LF%
@if errorlevel 1 goto error


@call b\done.bat
@goto end
:error
@echo ERROR during build!
:end
@call b\unset.bat
