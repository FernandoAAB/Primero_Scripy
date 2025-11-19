@echo off
color 0f
mode 60,30
if "%time%" LSS "12:00:00,00" ( msg /TIME:4 *  Bom Dia ! ) ELSE if "%time%" LSS "18:00:00,00" ( msg /TIME:4 * Boa Tarde !) ELSE ( msg  /TIME:4 * Boa Noite ! )
TASKLIST /fi "WINDOWTITLE eq Whatsapp - google chrome" |find /I "chrome.exe" > nul
	if %errorlevel% == 1 ( start /max chrome.exe https://web.whatsapp.com )
TASKLIST /fi "WINDOWTITLE eq ASSITENTE." | find /I "cmd.exe" > nul
	if %errorlevel% == 0 ( TASKKILL /fi "WINDOWTITLE eq ASSITENTE." > nul )
if exist Notas.txt ( msg /w /TIME 3 * "Notas!" )
if exist Historico_do_google.vbs ( del Historico_do_google.vbs ) else if exist eviar-msg.vbs ( del eviar-msg.vbs ) else if exist Pesquisar.vbs ( del Pesquisar.vbs )
:fim
title ASSITENTE.
mode 60,30
color 0f
cls
echo.
echo """¶¶¶¶¶¶7""""""""""""$¶¶¶¶$ 
echo ""¶¶¶¶¶¶¶¶7"""""""""""$¶¶¶¶¶$     COMO POSSO AJUDAR?
echo ""¶¶¶¶¶¶¶¶¶¢""""""""""¶¶¶¶¶¶¶$
echo ""ø¶¶¶¶¶$¶¶¶¶"""""""""¢¶¶¶¶¶¶¶¶$   1=REDES SOCIAIS
echo ""¶¶¶¶¶¶¶¶¶¶¶¶""""""""¶¶¶¶¶¶¶¶¶ø
echo """¶¶¶¶¶¶¶¶¶¶¶¶¢""""""¶¶¶¶¶¶¶¶¶o  2=TRABALHO
echo """"¶¶¶¶¶¶¶¶¶¶¶¶""""""¶¶¶¶¶¶¶¶¶
echo """"""¢¶¶¶¶¶¶¶¶¶¶¶""""¶¶¶¶¶¶¶¶¶  3=MOVER
echo """"""¶¶¶¶¶$¶¶¶¶¶7"""¶¶¶¶¶¶¶¶7
echo """"""""7¶¶¶¶¶¶¶¶¶¶""¶¶¶¶¶¶¶¶  4=INFO-PC
echo """"""""""o¶¶¶¶¶¶¶¶""¶¶¶¶¶¶¶
echo """"""""""""$¶¶¶¶¶¶o¶¶¶¶¶¶¶  5=SAIR
echo """"""""""o¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"""""¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"""¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶7
echo """"""¶¶¶¶--¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """""¶¶¶¶----¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"¶¶¶¶¶¶--¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """""¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"""¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"""""77¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """"""""""o¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
echo """""""""""¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶ 
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
choice /t 10 /c 12345 /cs /d 5 /n /m "ADIGITE => "
if errorlevel=5 exit
if errorlevel=4 goto a27
if errorlevel=3 goto a1
if errorlevel=2 goto c2
if errorlevel=1 goto c1
:a1
mode 70,20
color 0a
echo.
echo Caminho do arquivo ou arquivo, destino a se movero arquivo.
echo          V para voltar C para auterar o caminho.
echo.
set /p cam= Caminho: 
if "%cam%" == "V" goto fim
if "%cam%" == "v" goto fim
:mov
mode 80,40
set /p doc= Documento: 
if "%doc%" == "C" goto a1
if "%doc%" == "c" goto a1
if "%doc%" == "V" goto fim
if "%doc%" == "v" goto fim
cls
move "%doc%" "%cam%"
goto mov
)
:c1
color 0b
title ASSITENTE.
mode 30,29
cls
echo.
echo    DESEJA FAZER O QUE?
echo.
echo  Whatsapp=^>1
echo.
echo  Facebook=^>2
echo.
echo  Youtube=^>3
echo.
echo  Ler Textos=^>4
echo.
echo =============================
echo.
echo    APAGAR HISTORICO
echo.
echo  Historico do google=^>5
echo.
echo =============================
echo.
echo    MENSAGENS
echo.
echo  Eviar-msg=^>6
echo.
echo =============================
echo.
echo  Voltar=^>7
echo.
choice /c 1234567 /n /m "DIGITE => "
if errorlevel=7 goto fim
if errorlevel=6 goto a28
if errorlevel=5 goto a26
if errorlevel=4 start www.oratlas.com/leitor-de-texto-online & exit
if errorlevel=3 goto Pesquisa
if errorlevel=2 start /max https://www.facebook.com & exit
if errorlevel=1 start /max https://web.whatsapp.com & exit
:c2
color 0b
title ASSITENTE.
mode 145,39
echo _________________________________________________________________________________________________________________________________________________
echo.
echo                       __7¶¶¶¶¶¶¶¶¶¶¶¶¶¶$7__      ____  _____              ____ _      ___   _________ __                    ____
echo              _______¶¶¶¶¶ø          __ ¢¶¶¶¶¶7_     ___           ........................................................................
echo                  7¶¶¶       __            __¶¶¶ø                  Ý             ____              ASSISTENTE                             Ý
echo                 ¶¶¶          _    _____       ¢¶¶              __ Ý----------------------------------------------------------------------Ý _____
echo      _____      ¶¶ _____       __    ___        ¶¶                Ý MP = MONITOR DE PROCERSOSÝ  RS = RASTREAR SITE    Ý    N = NOTA      Ý
echo         __    ¶¶             _____               ¶¶     _____     Ý==========================Ý========================Ý==================Ý
echo              ¶¶                       ___         ¶¶______        Ý VI = VISIVEL TXT ARQUIVO Ý  I = MEDIR INTERNET    Ý   ND = DEL NOTA  Ý__
echo              ¶¶ 1¶1 ___                    ____¶¶ /¶              Ý__________________________Ý________________________Ý__________________Ý
echo     _____    ¶o ¶¶__                           ¶¶//¶            __Ý              ______            ___                Ý                  Ý
echo              ¶o ¶¶         ___                 ¶¶//¶              Ý 1 = CMD.   _____     11 = GERNCIADO DE TAREFAS  __Ý ____ __        __Ý
echo              ¶¶  ¶¶                            ¶¶/7¶            _ Ý                 _____                      ____   Ý==================Ý_
echo              ¢¶  ¶¶                           ¶¶//¶¶    ___       Ý 2 = OCUTAR.                                       Ý M = MOUSE        Ý    
echo               ¶¶ o¶   1¢ø¶¶¶¶1      ¶¶¶¶ø¢1   ¶¶/¶¶               Ý                               ___                 Ý==================Ý__
echo                ¶¶o¶ $¶¶¶¶¶¶¶¶¶ ____¶¶¶¶¶¶¶¶¶¶ ¶¶ø¶7___            Ý 3 = DESOCUTAR.                       ___  ____    Ý V = VOLTAR       Ý
echo                 ¶¶¶ ¶¶¶¶¶¶¶¶¶¶     ¶¶¶¶¶¶¶¶¶¶ ¶¶¶                 Ý               _____           __        /_\       Ý==================Ý
echo    _____¶¶ø ______¶ø  ¶¶¶¶¶¶¶¶      ¶¶¶¶¶¶¶¶o__¶7      ø¶¶$       Ý 4 = LIXEIRA.                           // \\      Ý R = REINICIAR    Ý
echo       ¶¶7¶¶     1¶   ø¶¶¶¶¶¶   7 7   o¶¶¶¶¶¶   ¶¶     ¶¶1¢¶7      Ý                               _____   //_ß_\\     Ý==================Ý
echo      7¶   ¶¶    1¶     oøø    ¶¶7¶¶    oøo     ¶$    ¶¶ //¶$      Ý 5 = CANSELAR DESLIGAMETO.             \\   //     Ý D = DESLIGAR PC  Ý
echo     o¶¶    ¶¶¶¶  ¶¶ ___      ¶¶¶_¶¶¶          $¶  ¶¶¶¶   //¶¶ø    Ý                                      _ \\ //      Ý==================Ý
echo    ¶¶    ___  ¶¶¶¶¶¶¶o       ¶¶¶_¶¶¶ ___   7¶¶¶¶¶¶¶1       /¶¶____Ý 6 = CALCULADORA.   __________          (Ý*Ý)      Ý S = SAIR         Ý
echo    ¶¶¶¶¶¶¶¶1     o¶¶¶¶¶¶¶    ¶¶¶_¶¶¶    $¶¶¶¶¶¶o      ¶¶¶¶¶¶¶¶    Ý                                        Ã===Ã      Ý==================Ý
echo      oøø1_¶¶¶¶¶      ¶1¶ø¶    ’’         ¶¶¶ ¶o     ¶¶¶¶¶1_øøø    Ý 7 = JUNTAR ARQUIVOS.         __        ÃÝÂÝÃ      Ý                  Ý __
echo              7¶¶¶¶ø  ¶ø¶ ¶¶           ø¶ ¶1¶  o¶¶¶¶o              Ý                                        Ã Ã Ã      Ý                  Ý ____
echo                  ø¶¶¶¶¶ ¶  ¶$¶¶¶¶¶¶¶¶¶ ø1 ¶¶¶¶¶$                  Ý 8 = PROGAMAR.                  __   ¶¶¶¶¶Ã Ã____  Ý DATA:%date%  Ý
echo   ________           ¶¶_¶_$¶_¶ø_¶_¶ø7¶oø¶_¶¶        ____          Ý                                 ¶¶¶/¶¶¶¶¶Ã Ã      Ý------------------Ý
echo        _______     ¶¶¶¶_ø¶_¶_¶¶_¶_¶ø_¶_¶¶_¶¶¶¶o                   Ý 9 = ABRIR ARQUIVOS NO OCULTO. ¶¶¶/¶¶¶¶¶¶¶¶¶Ã¶     ÝHORAS:%time% Ý
echo           _____o¶¶¶¶ 1¶   o¶¶¶¶ø¶o¶¶¶¶ø   ¶ø $¶¶¶¶       ____     Ý                              ¶¶////¶¶¶¶¶¶¶¶¶¶¶    Ý                  Ý
echo        ¶¶¶¶¶¶¶¶¶o     ¶¶ _____           ¶¶      ¶¶¶¶¶¶¶¶¶        Ý 10 = PARAR PROCESSOS.      ¶¶//¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶  Ý ___          ___ Ý
echo       ¶¶           ¶¶¶¶¶¶¶             ¶¶¶ø¶¶¶o          ¶¶      _Ý                          ¶¶/¶/¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶Ý¶                 Ý
echo        ¶¶¶     1¶¶¶¶     ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶     ¶¶¶¶ø     ¶¶¶        Ý                 ______ ¶¶¶//¶///¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶Ý¶¶  _____         Ý___
echo          ¶¶   ¶¶¢___________7$¶¶¶¶¶¶7           7¶¶   ¶¶        __Ý___________________________________________________Ý__________________Ý
echo          ¢¶  ¶¶                                   ¶¶  ¶¶_______
echo           ¶¶¶ø                                     ¢¶¶¶             DIRETORIO: %cd%
echo _________________________________________________________________________________________________________________________________________________
echo.
set /p b3= .                                                      DIGITE =^> 
if "%b3%" == "1" cd.. & start cmd & goto fim
if "%b3%" == "2" goto a4
if "%b3%" == "3" goto a2
if "%b3%" == "4" goto a6
if "%b3%" == "5" SHUTDOWN -a & goto fim
if "%b3%" == "6" goto a8
if "%b3%" == "7" goto a10
if "%b3%" == "8" goto c3
if "%b3%" == "9" goto a24
if "%b3%" == "10" goto c5
if "%b3%" == "11" start Taskmgr.exe & goto c2
if "%b3%" == "V" goto fim
if "%b3%" == "v" goto fim
if "%b3%" == "S" exit
if "%b3%" == "s" exit
if "%b3%" == "I" goto a29
if "%b3%" == "i" goto a29
if "%b3%" == "D" SHUTDOWN -s -f -t: 5 & goto fim
if "%b3%" == "d" SHUTDOWN -s -f -t: 5 & goto fim
if "%b3%" == "R" SHUTDOWN -r -f -t: 5 & goto fim
if "%b3%" == "r" SHUTDOWN -r -f -t: 5 & goto fim
if "%b3%" == "ND" goto Notas2
if "%b3%" == "nd" goto Notas2
if "%b3%" == "N" goto Notas
if "%b3%" == "n" goto Notas
if "%b3%" == "RS" goto rast
if "%b3%" == "rs" goto rast
if "%b3%" == "M" goto mouse
if "%b3%" == "m" goto mouse
if "%b3%" == "mp" start perfmon.exe & goto c2
if "%b3%" == "MP" start perfmon.exe & goto c2
if "%b3%" == "VI" goto a31
if "%b3%" == "vi" goto a31
goto c2
:a2
color 0a
title DESOCUTAR.
cls
echo.
echo VOUTAR=^>V
echo.
echo              DESOCUTAR
echo.
echo.
timeout /t 3 /NOBREAK > nul
:a3
mode 40,5
cls
echo.
set /p b4=   DIGITE =^> 
if "%b4%" == "V" goto fim
if "%b4%" == "v" goto fim
ATTRIB -h %b4%
goto a3
:a4
color 0e
title OCUTAR.
cls
echo.
echo VOUTAR=^>V
echo.
echo              OCUTAR
echo.
echo.
timeout /t 3 /NOBREAK > nul
:a5
mode 40,5
cls
echo.
set /p b5=   DIGITE =^> 
if "%b5%" == "V" goto fim
if "%b5%" == "v" goto fim 
set /p g1=   DIGITE O TENPO=^> 
if "%g1%" == "V" goto fim
if "%g1%" == "v" goto fim 
ATTRIB +h %b5%
echo @echo off>> H.C.cmd
echo mode 55,7 >> H.C.cmd
echo color f0>> H.C.cmd
echo title APAGANDO DADOS.>> H.C.cmd
echo echo prosesando....>> H.C.cmd
echo timeout /t %g1% /NOBREAK>> H.C.cmd
echo cls >> H.C.cmd
echo timeout /t -1>> H.C.cmd
echo cls >>"H.C.cmd"
echo attrib -h %b5%>> H.C.cmd
echo del H.C.cmd>> H.C.cmd"
echo cls>> H.C.cmd
goto a5
:a6
color 0c
title LIXEIRA.
cls
echo.
echo VOUTAR=^>V
echo.
echo               LIXEIRA
echo.
echo.
timeout /t 3 /NOBREAK > nul
:a7
mode 40,5
cls
echo.
set /p b6=   DIGITE =^> 
if "%b6%" == "V" goto fim
if "%b6%" == "v" goto fim
if exist %b6% (
del %b6%
echo apagado.
timeout /t 3 /NOBREAK > nul
goto a7
) else (
echo nao foi econtrado tente novamente.
timeout /t 3 /NOBREAK > nul
goto a7
)
:a8
color 0a
title CALCULADORA.
cls
echo.
echo VOUTAR=^>V
echo.
echo               CALCULADORA
echo.
echo.
timeout /t 3 /NOBREAK > nul
:a9
mode 25,20
cls
echo Digite um valor
set /p b7=numero:
if "%b7%" == "V" goto fim
if "%b7%" == "v" goto fim
set /a  calc=%b7%
cls
echo OK o reutado = %calc%
timeout /t 2 /NOBREAK > nul
cls
goto a9
:a10
color 0a
title JUNTAR ARQUIVOS.
cls
echo.
echo VOUTAR=^>V
echo.
echo               JUNTAR ARQUIVOS
echo.
echo.
timeout /t 3 /NOBREAK > nul
mode 55,15
color 0f
cls
echo.
set /p b8=   DIGITE O PRIMERO ARQUIVO=^> 
if "%b8%" == "V" goto fim
if "%b8%" == "v" goto fim
set /p b9=   DIGITE O SEGUNDO ARQUIVO=^> 
if "%b9%" == "V" goto fim
if "%b9%" == "v" goto fim 
set /p b10=   DIGITE O NOME FINAL DO ARQUIVO=^> 
if "%b10%" == "V" goto fim
if "%b10%" == "v" goto fim 
copy /b %b8% + %b9% %b10% > nul
goto fim
:c3
mode 26,10
title PROGAMARS.
color 0a
cls
echo.
echo PROGAMAR=^>1
echo.
echo PROGAMAR PERSONALIZADA=^>2
echo.
echo ADICIONAIS=^>3
echo.
echo VOUTAR=^>4
echo.
set /p b11=   DIGITE=^>
if "%b11%" == "1" goto a11
if "%b11%" == "2" goto a21
if "%b11%" == "3" goto a12
if "%b11%" == "4" goto fim
goto c3
:a11
mode 22,8
color 0f
echo.
set /p b12= NOME:
echo @echo off>> %b12%.txt
echo color>> %b12%.txt
echo title %b12%.>> %b12%.txt
echo cls>> %b12%.txt
start /max %b12%.txt
goto fim
:a12
color 0f
mode 50,5
cls
echo.
set /p b13= DESEJA COMECAR DO COMECO SE SIM APERTE "ENTER" OU NAO DEGITE NAO:
cls
echo.
set /p b14= NOME:
if "%b13%" == "NAO" goto c4
if "%b13%" == "nao" goto c4
if "%b13%" == "N" goto c4
if "%b13%" == "n" goto c4
echo @echo off>> %b14%.txt
echo color Cf>> %b14%.txt
echo title %b14%.>> %b14%.txt
echo cls>> %b14%.txt
:c4
mode 22,25
color 0b
echo.
echo  ADICIONAIS
echo.
echo CAVERA=^>1
echo.
echo CORACAO=^>2
echo.
echo DESLIGAR=^>3
echo.
echo HORA E DATA=^>4
echo.
echo RAPETIR COMAMDO=^>5
echo.
echo REPETIR ATE A QUI=^>6
echo.
echo =====================
echo.
echo ABRIR=^>7
echo.
echo DELETAR=^>8
echo.
echo VOUTAR=^>9
echo.
set /p b15= DIGITE=^>
if "%b15%" == "1" goto a15
if "%b15%" == "2" goto a16
if "%b15%" == "3" goto a17
if "%b15%" == "4" goto a18
if "%b15%" == "5" goto a19
if "%b15%" == "6" goto a20
if "%b15%" == "7" start %b14%.txt & goto c4
if "%b15%" == "8" del %b14%.txt & goto c4
if "%b15%" == "9" goto fim
goto c4
:a15
echo echo.>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´´´´´´´´7¶¶¶¶¶¶¶¶¶¶¶¶¶¶$7´´´´´´´´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´´´´¶¶¶¶¶ø´´´´´´´´´´´´´¢¶¶¶¶¶7´´´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´7¶¶¶´´´´´´´´´´´´´´´´´´´´´´´¶¶¶ø´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´¶¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´¢¶¶´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¶¶´1¶1´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´¶¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¶o´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¶o´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¶¶´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶ø´7¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´¢¶´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶¶´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´¶¶´o¶´´´1¢ø¶¶¶¶1´´´´´´¶¶¶¶ø¢1´´´¶¶´¶¶´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´¶¶o¶´$¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶¶¶¶¶¶¶´¶¶ø¶7´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´¶¶¶´¶¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶¶¶¶¶¶¶´¶¶¶´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´¶¶ø´´´´´´´¶ø´´¶¶¶¶¶¶¶¶´´´´´´´¶¶¶¶¶¶¶¶o´´¶7´´´´´´ø¶¶$´´´>> %b14%.txt
echo echo   ´´´¶¶7¶¶´´´´´1¶´´´ø¶¶¶¶¶¶´´´7´7´´´o¶¶¶¶¶¶´´´¶¶´´´´´¶¶1¢¶7´´>> %b14%.txt
echo echo   ´´7¶´´´¶¶´´´´1¶´´´´´oøø´´´´¶¶7¶¶´´´´oøo´´´´´¶$´´´´¶¶´´´¶$´´>> %b14%.txt
echo echo   ´o¶¶´´´´¶¶¶¶´´¶¶´´´´´´´´´´¶¶¶´¶¶¶´´´´´´´´´´$¶´´¶¶¶ ¶´´´´¶¶ø>> %b14%.txt
echo echo   ¶¶´´´´´´´´´¶¶¶¶¶¶¶o´´´´´´´¶¶¶´¶¶¶´´´´´´´7¶¶¶¶¶¶¶1´´´´´´´´¶¶>> %b14%.txt
echo echo   ¶¶¶¶¶¶¶¶1´´´´´o¶¶¶¶¶¶¶´´´´¶¶¶´¶¶¶´´´´$¶¶¶¶¶¶o´´´´´´¶¶¶¶¶¶¶¶>> %b14%.txt
echo echo   ´´oøø1´¶¶¶¶¶´´´´´´¶1¶ø¶´´´´’’´´´´´´´´´¶¶¶´¶o´´´´´¶¶¶¶¶1´øøø>> %b14%.txt
echo echo   ´´´´´´´´´´7¶¶¶¶ø´´¶ø¶´¶¶´´´´´´´´´´´ø¶´¶1¶´´o¶¶¶¶o´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´ø¶¶¶¶¶´¶´´¶$¶¶¶¶¶¶¶¶¶´ø1´¶¶¶¶¶$´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´´´´´¶¶´¶´$¶´¶ø´¶´¶ø7¶oø¶´¶¶´´´´´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´´´´´¶¶¶¶´ø¶´¶´¶¶´¶´¶ø´¶´¶¶´¶¶¶¶o´´´´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´´´´´´´´´o¶¶¶¶´1¶´´´o¶¶¶¶ø¶o¶¶¶¶ø´´´¶ø´$¶¶¶¶´´´´´´´´´´´´>> %b14%.txt
echo echo   ´´´´¶¶¶¶¶¶¶¶¶o´´´´´¶¶´´´´´´´´´´´´´´´´´¶¶´´´´´´¶¶¶¶¶¶¶¶¶´´´´>> %b14%.txt
echo echo   ´´´¶¶´´´´´´´´´´´¶¶¶¶¶¶¶´´´´´´´´´´´´´¶¶¶ø¶¶¶o´´´´´´´´´´¶¶´´´>> %b14%.txt
echo echo   ´´´´¶¶¶´´´´´1¶¶¶¶´´´´´¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶ø´´´´´¶¶¶´´´´>> %b14%.txt
echo echo   ´´´´´´¶¶´´´¶¶¢´´´´´´´´´´´7$¶¶¶¶¶¶7´´´´´´´´´´´7¶¶´´´¶¶´´´´´´>> %b14%.txt
echo echo   ´´´´´´¢¶´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶¶´´´´´´>> %b14%.txt
echo echo   ´´´´´´´¶¶¶ø´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¢¶¶¶´´´´´´´>> %b14%.txt
echo echo.>> %b14%.txt
goto c4
:a16
echo echo.>> %b14%.txt
echo echo   _______00000000000_______000000000000>> %b14%.txt
echo echo   _____000000000000000__00000000000000000>> %b14%.txt
echo echo   ___0000000000000000000000000_______00000>> %b14%.txt
echo echo   __00000000000000000000000000_________0000>> %b14%.txt
echo echo   _00000000000000000000000000000________0000>> %b14%.txt
echo echo   0000000000000000000000000000000000_____0000>> %b14%.txt
echo echo   00000000000000000000000000000000000___00000>> %b14%.txt
echo echo   0000000000000000000000000000000000000000000>> %b14%.txt
echo echo   _00000000000000000000000000000000000000000>> %b14%.txt
echo echo   __000000000000000000000000000000000000000>> %b14%.txt
echo echo   ____00000000000000000000000000000000000>> %b14%.txt
echo echo   ______0000000000000000000000000000000>> %b14%.txt
echo echo   _________00000000000000000000000000>> %b14%.txt
echo echo   ____________000000000000000000000>> %b14%.txt
echo echo   ______________0000000000000000>> %b14%.txt
echo echo   _________________0000000000>> %b14%.txt
echo echo   ___________________000000>> %b14%.txt
echo echo   ____________________0000>> %b14%.txt
echo echo   _____________________00>> %b14%.txt
echo echo   ______________________0>> %b14%.txt
echo echo.>> %b14%.txt
goto c4
:a17
mode 30,3
color 0f
cls
set /p b16= TEMPO DO DESLIGAMENTO:
echo SHUTDOWN -s -f -t: %b16%>> %b14%.txt
goto c4
:a18
echo echo.>> %b14%.txt
echo echo HORAS:%time%>> %b14%.txt
echo echo.>> %b14%.txt
echo echo DATA:%date%>> %b14%.txt
echo echo.>> %b14%.txt
goto c4
:a19
mode 30:3
color 0f
cls
set /p b17= MOME PARA REPITIR COMANDOS:
echo :%b17%>> %b14%.txt
echo cls>> %b14%.txt
goto c4
:a20
echo goto %b17%>> %b14%.txt
goto c4
:a21
color 0a
title PROGAMAR PERSONALIZADA.
cls
echo.
echo  VOUTAR=^>V  LINPAR=^>L
echo.
echo  PROGAMAR PERSONALIZADA
echo.
echo.
timeout /t 3 /NOBREAK > nul
mode 22,5
:a22
color 0f
set /p b18= NOME:
echo @echo off>>%b18%.txt
set /p b19= COR:
color %b19%
mode 50,20
:a23
set /p b20= :=^>
if "%b20%" == "L" cls & goto a23
if "%b20%" == "l" cls & goto a23
if "%b20%" == "v" goto fim
if "%b20%" == "V" goto fim
echo %b20%>>%b18%.txt
goto a23
:a24
cls
mode 30,10
set /p b21= CAMINHO=^>
set /p b22= ARQUIVO=^>
cd\
cd %b21%
if exist %b22% ( goto a25 ) else ( cls & msg * "NAO ENCONTRADO." & goto fim )
:a25
msg * arquivo precisa de atencao (%b21% %b22%) !
echo set objshell = wscript.createobject("wscript.shell") >> oculto.vbs
echo objshell.run("%b22%"),0, true>> oculto.vbs
goto fim
:c5
cls
mode 22,13
color 0b
echo.
echo O QUE POSSO PARAR?
echo.
echo .vbs=^>1
echo.
echo .cmd=^>2
echo.
echo Personalizado=^>3
echo.
echo Voutar=^>4
echo.
set /p b23=   DIGITE =^> 
if "%b23%" == "1" taskkill /f /im wscript.exe & cls & goto c5
if "%b23%" == "2" taskkill /f /im cmd.exe & cls & goto c5
if "%b23%" == "3" goto a30
if "%b23%" == "4" goto fim
echo msgbox "Erro ( %b23% ) codico invalido tente nova novamente.",vbinfomation,"AVISO" > %temp%\cod.vbs
start %temp%\cod.vbs
timeout /t 1 /NOBREAK > nul
del %temp%\cod.vbs
goto fim
:a26
echo set fera =createobject("wscript.shell")>>Historico_do_google.vbs
echo fera.run("chrome.exe")>>Historico_do_google.vbs
echo wscript.sleep 4000>>Historico_do_google.vbs
echo fera.sendkeys"{f11}">>Historico_do_google.vbs
echo fera.run("chrome.exe https://www.google.com")>>Historico_do_google.vbs
echo wscript.sleep 10000>>Historico_do_google.vbs
echo fera.sendkeys "^(h)">>Historico_do_google.vbs
echo wscript.sleep 2000>>Historico_do_google.vbs
echo fera.sendkeys"{tab}">>Historico_do_google.vbs
echo wscript.sleep 1000>>Historico_do_google.vbs
echo fera.sendkeys "^(a)">>Historico_do_google.vbs
echo wscript.sleep 1000>>Historico_do_google.vbs
echo fera.sendkeys"{bksp}">>Historico_do_google.vbs
echo wscript.sleep 2000>>Historico_do_google.vbs
echo fera.sendkeys"{enter}">>Historico_do_google.vbs
echo wscript.sleep 1000>>Historico_do_google.vbs
echo fera.run"taskkill /im chrome.exe",false>>Historico_do_google.vbs
timeout /t 2 /NOBREAK > nul
start Historico_do_google.vbs
exit
:a27
title INFO-PC.
color f0
mode 110,190
echo -------------------------------------------------------------------------
echo USUARIO:%username%
echo -------------------------------------------------------------------------
echo DATA:%date%                   HORA:%time%
echo -------------------------------------------------------------------------
echo TARFAS EM EXECUCAO NO MOMENTO,SERVICOS:
echo. 
TASKLIST
echo.
echo --------------------------------------------------------------------------
echo.
echo COFIGURACAO DE IP DO WINDOWS:
echo.
ipconfig
echo.
echo ----------------------------------------------------------------------------
echo.
echo CONFIGURACAO E PROPRIEDADES ESPECIFICAS DA MAQUINA:
echo. 
SYSTEMINFO
echo ============================================================================
echo.
echo APERTE ENTER PARA CONTINUAR..
echo.
pause > nul
cls
goto fim
:a28
title Eviar-msg.
color f0
mode 50,5
echo.
echo carregando.....
echo.
echo wscript.sleep 3000>> eviar-msg.vbs
echo Strtext = "BEM-VINDO">> eviar-msg.vbs
echo set Objvoice = createobject("SAPI.Spvoice")>> eviar-msg.vbs
echo ObjVoice.Rate=-2>> eviar-msg.vbs
echo ObjVoice.Speak StrText>> eviar-msg.vbs
echo wscript.sleep 5000>> eviar-msg.vbs
echo set fera =createobject("wscript.shell")>> eviar-msg.vbs
echo pessoa = InputBox ("PESSOA.","eviar-msg")>> eviar-msg.vbs
echo mensagem = InputBox ("ESCREVA A MENSAGEM PARA ENVIAR.","eviar-msg")>> eviar-msg.vbs
echo wscript.sleep 4000>> eviar-msg.vbs
echo fera.run("chrome.exe")>> eviar-msg.vbs
echo wscript.sleep 4000>> eviar-msg.vbs
echo fera.sendkeys"{f11}">> eviar-msg.vbs
echo fera.run("chrome.exe https://web.whatsapp.com/send?phone=")>> eviar-msg.vbs
echo wscript.sleep 20000>> eviar-msg.vbs
echo fera.sendkeys"{tab}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys pessoa>> eviar-msg.vbs
echo wscript.sleep 2000>> eviar-msg.vbs
echo fera.sendkeys"{enter}">> eviar-msg.vbs
echo wscript.sleep 3000>> eviar-msg.vbs
echo fera.sendkeys"{tab}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{tab}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{tab}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{enter}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys "PC">> eviar-msg.vbs
echo fera.sendkeys"{enter}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys " ">> eviar-msg.vbs
echo wscript.sleep 2000>> eviar-msg.vbs
echo fera.sendkeys mensagem>> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{enter}">> eviar-msg.vbs
echo wscript.sleep 4000>> eviar-msg.vbs
echo fera.sendkeys "^(h)">> eviar-msg.vbs
echo wscript.sleep 3000>> eviar-msg.vbs
echo fera.sendkeys"{tab}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys "^(a)">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{bksp}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys"{enter}">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.sendkeys "^(w)">> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo fera.run"taskkill /im chrome.exe",false>> eviar-msg.vbs
echo wscript.sleep 5000>> eviar-msg.vbs
echo fera.run"taskkill /im wscript.exe",false>> eviar-msg.vbs
echo wscript.sleep 1000>> eviar-msg.vbs
echo Strtext = "O PROCESSO FOI CONCLUIDO.">> eviar-msg.vbs
echo set Objvoice = createobject("SAPI.Spvoice")>> eviar-msg.vbs
echo ObjVoice.Rate=-2>> eviar-msg.vbs
echo ObjVoice.Speak StrText>> eviar-msg.vbs
timeout /t 2 /NOBREAK > nul
start eviar-msg.vbs
exit
:a29
mode 60,400
color 0a
set /p b24=   DIGITE O IP =^> 
cls
ping -t %b24%
:a30
cls
color 0c
mode 40,6
echo.
echo V=^>VOLTAR
echo.
set /p b25=   DIGITE =^>
if "%b25%" == "V" goto c2
if "%b25%" == "v" goto c2
taskkill /f /im %b25%
goto a30
:Pesquisa
echo set fera =createobject("wscript.shell")>>Pesquisar.vbs
echo pesquisa = InputBox ("Pesquisar...","PESQUISA")>>Pesquisar.vbs
echo fera.run("chrome.exe https://www.youtube.com/results?search_query=")>>Pesquisar.vbs
timeout /t 2 /NOBREAK > nul
start Pesquisar.vbs
exit
:Notas
if exist Notas.txt ( start Notas.txt & goto c2 ) else ( echo > Notas.txt & start Notas.txt & goto c2 )
:Notas2
if exist Notas.txt ( del Notas.txt & msg /TIME 3 * "Foi Deletado"  & goto c2 ) else ( goto c2 )
:rast
mode 100,30
color 0f
cls
echo.
echo V=^>VOLTAR
echo.
timeout /t 2 /NOBREAK > nul
cls
echo.
set /p rast=   SITE =^>
if "%rast%" == "V" goto fim
if "%rast%" == "v" goto fim
tracert %rast%
echo.
echo APERTE ENTER PARA CONTINUAR..
pause > nul
goto c2
:mouse
echo wscript.sleep 2000>> Mouse.vbs
echo set fera =createobject("wscript.shell")>> Mouse.vbs
echo fera.run("explorer.exe")>>Mouse.vbs
echo wscript.sleep 2000>> Mouse.vbs
echo fera.sendkeys"{tab}{tab}{tab}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{enter}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys "Painel de Controle\Todos os Itens do Painel de Controle/Mouse">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{enter}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{tab}{tab}{tab}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{tab}{tab}{tab}">> Mouse.vbs
echo fera.sendkeys"{right}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{tab}{tab}{tab}">> Mouse.vbs
echo wscript.sleep 1000>> Mouse.vbs
echo fera.sendkeys"{enter}">> Mouse.vbs
start Mouse.vbs
timeout /t 2 /NOBREAK > nul
del Mouse.vbs
exit
:a31
mode 200,100
set /p txt=   ARQUIVO =^>
if "%txt%"== "V" goto fim
if "%txt%"== "v" goto fim
Type %txt%
pause

