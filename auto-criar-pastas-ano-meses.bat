@chcp 1252 > nul 
@echo[
@echo[
@echo 	Olá %username% 
@echo[
@echo 	==========================================================================
@echo 	Este 'programa' cria automaticamente uma pasta de certo ano (p. ex. 2015), 
@echo 	dentro da qual cria 12 pastas mensais (04_Abril, 05_Maio, etc).
@echo[
@echo 	Pode incluir pastas diárias ou alterar os nomes das pastas (abrir 
@echo 	este ficheiro .bat com o "bloco de notas" e ver notas no final)
@echo 	==========================================================================
@echo[
@echo[
@echo off & setlocal
set year=%1
if "%year%"=="" set /p year=Indique o ano que pretende e carregue em 'Enter' 
if "%year%"=="" goto :eof
set /a mod=year %% 400
if %mod%==0 set leap=1 && goto :mkyear
set /a mod=year %% 100
if %mod%==0 set leap=0 && goto :mkyear
set /a mod=year %% 4
if %mod%==0 set leap=1 && goto :mkyear
set leap=0

:mkyear
call :mkmonth 01 Janeiro 31
call :mkmonth 02 Fevereiro 28+leap
call :mkmonth 03 Março 31
call :mkmonth 04 Abril 30
call :mkmonth 05 Maio 31
call :mkmonth 06 Junho 30
call :mkmonth 07 Julho 31
call :mkmonth 08 Agosto 31
call :mkmonth 09 Setembro 30
call :mkmonth 10 Outubro 31
call :mkmonth 11 Novembro 30
call :mkmonth 12 Dezembro 31
goto :eof

:mkmonth
set month=%1
set mname=%2
set /a ndays=%3
for /l %%d in (1,1,9)        do mkdir %year%\%month%_%mname%
for /l %%d in (10,1,%ndays%) do mkdir %year%\%month%_%mname%

REM para criar pastas diárias em cada pasta mensal, acrescentar \%%d% ao fim das duas linhas finais
REM para alterar os nomes dos meses, alterar a lista de meses (p.ex JAN em vez de Janeiro).
REM para alterar os nomes das pastas, 'brincar' com a configuração das duas últimas linhas,
REM p.ex. para ficar " ano \ ano_mês \ ano_mês_dia . Importante: respeitar o uso de \ em vez de /.

