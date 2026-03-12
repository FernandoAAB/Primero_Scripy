@echo off
color 0f
mode 73,35
title Automação.
@REM 
set para1="CAMINHO1"
set copiar1="COPIA DESSA PASTA PARA1"

set para2="CAMINHO2"
set copiar2="COPIA DESSA PASTA PARA2"

set para3="CAMINHO3"
set copiar3="COPIA DESSA PASTA PARA3"

echo.
echo ------------------------------------------------------------
set /p ini= Verificar unidade F: G:  S/N ? 
:imagem
set /a parte+=1
cls
echo.
echo "                        .,,uod8B8bou,,.                              "
echo "                ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.                    "
echo "           ,:m8BBBBBBBBBBBBBBBRPFT!!||||||||||||||                   "
echo "           !...:!TVBBBRPFT||||||||||!!^^""'   ||||                   "
echo "           !.......:!?|||||!!^^""'            ||||                   "
echo "           !.........||||                     ||||                   "
if "%parte%" lss "5" (
	if "%parte%" geq "1" ( echo "           !.........||||  #                  ||||                   " )
	if "%parte%" geq "2" ( echo "           !.........||||  ##                 ||||                   " 
		) else ( echo "           !.........||||                     ||||                   " )
	if "%parte%" geq "3" ( echo "           !.........||||  ###                ||||                   " 
		) else ( echo "           !.........||||                     ||||                   " )
	if "%parte%" geq "4" ( echo "           !.........||||  ####               ||||                   " 
		) else ( echo "           !.........||||                     ||||                   " )
)
if "%parte%" geq "5" (
	echo "           !.........||||        _.-;;-._     ||||                   "
	echo "           !.........|||| '-..-'|   ||   |    ||||                   "
	echo "           !.........|||| '-..-'|_.-;;-._|    ||||                   "
	echo "           !.........|||| '-..-'|   ||   |    ||||                   "
	echo "           !.........|||| '-..-'|_.-''-._|    ||||                   "
)

echo "           !.........||||                     ||||                   "
echo "           !.........||||                     ||||                   "
echo "           `.........||||                    ,||||                   "
echo "            .;.......||||               _.-!!|||||                   "
echo "     .,uodWBBBBb.....||||       _.-!!|||||||||!:'                    "
echo "  !YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....               "
echo "  !..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.             "
echo "  !....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.           "
echo "  !......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.         "
echo "  !........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.   "
echo "  `..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo. "
echo "    `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'"
echo "      `........::::::::::::::::;iof688888888888888888888b.     `     "
echo "        `......:::::::::;iof688888888888888888888888888888b.         "
echo "          `....:::;iof688888888888888888888888888888888899fT!        "
echo "            `..::!8888888888888888888888888888888899fT|!^"'          "
echo "              `' !!988888888888888888888888899fT|!^"'                "
echo "                  `!!8888888888888888899fT|!^"'                      "
echo "                    `!988888888899fT|!^"'                            "
echo "                      `!9899fT|!^"'                                  "
echo.
if "%parte%" lss "4" ( timeout /t 3 > nul ) else (timeout /t 5 > nul)

if "%parte%" equ "1" ( 
	robocopy copiar1% %para1% /E /MAXAGE:0 > nul
	goto imagem
)

if "%parte%" equ "2" ( 
	robocopy %copiar2% %para2% /E /MAXAGE:0 > nul
	goto imagem
)

if "%parte%" equ "3" ( 
	robocopy %copiar3% %para3%  /E /MAXAGE:0 > nul
	goto imagem
)
if /I "%parte%" equ "S" (
	if "%parte%" equ "4" ( 
		CHKDSK /f F: > nul
		echo .
		CHKDSK /r F: > nul
		echo ..
		CHKDSK /f G: > nul
		echo ...
		CHKDSK /r G: > nul
		echo ...
		timeout /t 2 > nul
		goto imagem
	)
)
if "%parte%" geq "5" ( 
	exit
) else ( goto imagem )
