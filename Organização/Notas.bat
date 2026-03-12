@echo off
title Reformulaฦo

set tempo=nd
set arquivo=a1
set destino_arquivo=a2
set /a contador=50
set camin=%cd%


if exist Dados (cd Dados) else (md Dados
cd Dados)

set pasta=%cd%
for %%a in (%pasta%) do set pasta1=%%a
set pasta2=%pasta:~0,3%

if not exist N๘ (md N๘
echo %date% >> data.log)
if not exist %arquivo%.txt (echo. >> %arquivo%.txt)
if not exist %destino_arquivo%.txt (echo. >> %destino_arquivo%.txt)
if not exist temp.txt (echo. >> temp.txt)

::CSS LINHAS
set l1=ษอออออออออออออออออออออออออออออออออออออออออออออออออออออ
set l2=ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออ
set l3=ศอออออออออออออออออออออออออออออออออออออออออออออออออออออ

set l4=ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
set l5=ฬออออออออออออออออออออออออออออออออออออออออออออออออออออป
set l6=ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
set cmhocomder_destino_arquivo=type %destino_arquivo%.txt

:1
cls
echo.
echo  %pasta2% ...%pasta1%          linhas: %contador%
echo.
if "%tempo%" == "nd" (type temp.txt) else (echo %sim%)
echo.
echo ษอออออออออออออออออออออออออออออออออออออออออออป
echo บ A=Abrir lista                             บ
echo บ B=Buscador %arquivo%.txt                         บ
echo บ                                           บ
echo บ AD=Adicionar numero manualmente           บ
echo บ P=por em lista                            บ
echo บ BL=Buscar na lista %destino_arquivo%.txt                 บ
echo บ L=Listar numerada                         บ
echo ศอออออออออออออออออออออออออออออออออออออออออออผ
echo.
set /p nota=  Aqui=^> 
if "%nota%" == "" goto 1
if /i "%nota%" == "P" (for /l %%x in (1, 1, %contador%) do type %destino_arquivo%.txt | find "[%%x]" >> N๘/ORDEN.txt
start N๘/ORDEN.txt
goto 1)
if /i "%nota%" == "AD" (cls
	goto Add-txt)
if /i "%nota%" == "BL" (cls
	goto Buscador
	)
if /i "%nota%" == "B" (cls
	set numero=1
	goto  Buscador1
	)
if /i "%nota%" == "A" (cls
	echo.
	type %destino_arquivo%.txt
	echo.
	pause > nul
	goto 1
	)
if /i "%nota%" == "L" if "%sim%" == "" (cls
echo.
echo %l1%
type temp.txt
echo %l2%
::sort /r /+1 %destino_arquivo%.txt | find /v "[1]"
::pause
for /l %%x in (1, 1, %contador%) do type %destino_arquivo%.txt | find "[%%x]"
goto css-lin ) else ( cls & goto 2 )
type %arquivo%.txt | find /i /n "%nota%" > temp.txt
if "%nota%" == "" goto 1
set /p sim=<temp.txt
%cmhocomder_destino_arquivo% | find /i "%nota%" > nul
if %errorlevel% lss 1 ( msg * tem & goto 1 )
echo บ %sim% >> %destino_arquivo%.txt
if %errorlevel% == 1 ( set numero_v=1
echo %l4%
::echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
goto css-lin)
:2
cd %camin%\Dados
echo.
echo %l1%
echo บ %sim%
echo %l2%
for /l %%x in (1, 1, %contador%) do type %destino_arquivo%.txt | find "[%%x]"


if %errorlevel% == 1 (goto css-lin)
goto 1

:css-lin
if not "%numero_v%" == "1" ( echo %l2%
echo บ %sim%
echo %l5%
)
echo บ                        OK !                        บ
echo %l6%
if "%numero_v%" == "1" (set numero_v=2& timeout /t 2 > nul & cls & goto 2)
pause > nul
goto 1

:Buscador
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo          V=^> Voltar                        %destino_arquivo%.txt
echo.
set /p Busc=Buscador=^> 
echo.
if /i "%Busc%" == "V" goto 1
if /i "%Busc%" == "S" (cd..)
type %destino_arquivo%.txt | find /i "%Busc%"
::if %errorlevel% gtr 0 ()
timeout /t 3 > nul
goto Buscador

:Buscador1
set /a numero+=1
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo          V=^> Voltar                        %arquivo%.txt
echo.
set /p Buscr=Buscador=^> 
echo.
if /i "%Buscr%" == "V" goto 1
if /i "%Buscr%" == "S" (cd..)
timeout /t 1 > nul
type %arquivo%.txt | find /i /n "%Buscr%"
if "%numero%" == "5" (echo.
	set numero=1
	echo Aguardando...
	pause > nul
	cls
	goto Buscador1
	)
timeout /t 3 > nul
goto Buscador1


:Add-txt
echo.
echo อออออออออออออออออออออ
echo          V=^> Voltar
echo.
set /p add=^> 
if /i "%add%" == "V" goto 1
type %arquivo%.txt | find /i /n "%add%" > temp.txt
set /p sim=<temp.txt
echo บ %sim% >> %destino_arquivo%.txt
echo บ %sim%
echo.
timeout /t 3 > nul
goto Add-txt

:dias-d
set /p data=<N๘/data.log
set dia=%data:~0,2%
set mes=%data:~3,2%
set ano=%data:~6,4%
set /a "d1=(%ano%-1970)*365+(%ano%-1969)/4-(%ano%-1901)/100+(%ano%-1601)/400+(%mes%*979-1033)/32+%dia%-1"
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "data2=%%a"
set /a "ano=%data2:~0,4%", "mes=%data2:~4,2%", "dia=%data2:~6,2%"
set /a "d2=(%ano%-1970)*365+(%ano%-1969)/4-(%ano%-1901)/100+(%ano%-1601)/400+(%mes%*979-1033)/32+%dia%-1"
set /a "diferenca=d2-d1"
echo A diferen็a de dias ้: %diferenca% > N๘/data1.log
goto CSS-LINHAS

