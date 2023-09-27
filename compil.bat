set fw_root=C:\Users\tiavi\Desktop\Test-deploy\Deploiement
@REM set project_lib=.\TestFramework\build\web\WEB-INF\lib\

mkdir src
mkdir build

for /r %fw_root%\ %%f in (*.java) do copy %%f .\src
javac -Xlint -cp servlet-api.jar -d .\build .\src\*.java
@REM jar -cf fw.jar -C .\Framework\build\web\WEB-INF\classes\ etu2025
::copy fw.jar %project_lib%

@REM rmdir /S /Q src
@REM rmdir /S /Q build