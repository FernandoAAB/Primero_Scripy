@echo off
chcp 65001 > nul
color 0f
mode 73,35
title Automação.

@REM Verifica o arquivo "Caminhos.txt"
set "ARQUIVO_CONFIG=Caminhos.txt"
if exist "%ARQUIVO_CONFIG%" (
    echo [INFO] Carregando caminhos salvos anteriormente...
    call "%ARQUIVO_CONFIG%"
    goto :continuar_script
) else (
    echo [INFO] Arquivo de configuracao não encontrado.
    echo Por favor, digite os caminhos pela primeira e unica vez.
    goto :pedir_caminhos
)

:pedir_caminhos
echo.
set /p para1="Digite o CAMINHO 1 (Destino): "
set /p copiar1="Digite o CAMINHO 1 (Origem/Copia): "
echo.
set /p para2="Digite o CAMINHO 2 (Destino): "
set /p copiar2="Digite o CAMINHO 2 (Origem/Copia): "
echo.
set /p para3="Digite o CAMINHO 3 (Destino): "
set /p copiar3="Digite o CAMINHO 3 (Origem/Copia): "

@REM Salva as variáveis dentro do arquivo TXT no formato "set variavel=valor"
(
    echo set "para1=%para1%"
    echo set "copiar1=%copiar1%"
    echo set "para2=%para2%"
    echo set "copiar2=%copiar2%"
    echo set "para3=%para3%"
    echo set "copiar3=%copiar3%"
) > "%ARQUIVO_CONFIG%"

:continuar_script
echo.
echo ===================================================
echo             CAMINHOS CARREGADOS PRONTOS:
echo ===================================================
echo 1. Para: %para1% ^| Copiar: %copiar1%
echo 2. Para: %para2% ^| Copiar: %copiar2%
echo 3. Para: %para3% ^| Copiar: %copiar3%
echo ===================================================
echo.
echo.
echo [OK] Caminhos salvos com sucesso em '%ARQUIVO_CONFIG%'!
timeout /t 3 > nul
echo.
echo ------------------------------------------------------------
set /p ini=Verificar unidades Contra Erros F: G:  S/N ? 
set "parte=0"
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
if %parte% LSS 4 (timeout /t 3 > nul) else (timeout /t 5 > nul)

if "%parte%" equ "1" (
    robocopy "%copiar1%" "%para1%" /E /MAXAGE:0 > nul
    goto imagem
)

if "%parte%" equ "2" (
    robocopy "%copiar2%" "%para2%" /E /MAXAGE:0 > nul
    goto imagem
)

if "%parte%" equ "3" (
    robocopy "%copiar3%" "%para3%" /E /MAXAGE:0 > nul
    goto imagem
)

if "%parte%" equ "4" (
    if /I "%ini%" equ "S" (
        echo [INFO] Executando verificacao de disco (CHKDSK)...
        :: Utiliza apenas /f para correcoes rápidas e não travar o script por horas
        chkdsk F: /f > nul
        echo .
        chkdsk G: /f > nul
        echo ..
        timeout /t 2 > nul
    )
    goto imagem
)

if "%parte%" geq "5" (
    echo [FIM] Processo concluido com sucesso!
    pause > nul
)
