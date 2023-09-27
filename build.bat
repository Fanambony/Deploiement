set tomcat_root=D:\Logiciel\Apache_Software_Foundation\Tomcat_10.0
set project_root=C:\Users\tiavi\Desktop\Test-deploy\Deploiement
@REM set fw_root=C:\Users\tiavi\Desktop\Framework\Framework
@REM set lib_root=.\temp\WEB-INF\lib\fw.jar

:: Cr�ation du dossier temporaire temp
mkdir temp
cd temp


:: Cr�ation de la structure du fichier
mkdir WEB-INF
@REM mkdir css/bootstrap
mkdir src
cd WEB-INF
mkdir classes
mkdir lib
@REM mkdir css
cd ../../


:: Compilation du modele
@REM copy fw.jar %lib_root%
@REM for /r %project_root%\ %%f in (*.java) do copy %%f .\temp\src
@REM javac -cp %lib_root% -parameters -d .\temp\WEB-INF\classes .\temp\src\*.java
@REM rmdir /S /Q .\temp\src


:: Copie des Autre fichiers
copy %project_root%\*.jsp .\temp\
copy %project_root%\web.xml .\temp\WEB-INF\
@REM xcopy .\TestFramework\web\css\* .\temp\css /E /I


:: D�ploiement vers tomcat
jar -cvf dev.war -C .\temp\ .
copy dev.war %tomcat_root%\webapps\


:: Supprimer le dossier temp
rmdir /S /Q .\temp
del dev.war