@echo off

echo Welcome to the VITE Bootstrapper!!!
set /p lang="Enter 'N' To Begin, or 'P' for peasy-install: "
set pee=P
set noo=N

echo Application Directory
echo %~dp0
chdir %~dp0
echo Current Working Directory
echo %cd%

echo Install NPM modules
call npm init -y

if %lang% EQU %noo% GOTO N1
if %lang% EQU %pee% GOTO P1


:P1
call npm i @peasy-lib/peasy-ui
call npm i @peasy-lib/peasy-input
call npm i @peasy-lib/peasy-assets

:N1
call npm i vite --save-dev
call npm i typescript --save-dev
call npm i json --save-dev

echo creating file structure
md src
md public
md dist
cd src
md assets
md components

echo creating /src/main.ts
echo import './style.css';>main.ts

if %lang% EQU %noo% GOTO N2
if %lang% EQU %pee% GOTO P2


:P2

echo import {UI} from '@peasy-lib/peasy-ui';>>main.ts
echo import {Assets} from '@peasy-lib/peasy-assets';>>main.ts
echo import {Input} from '@peasy-lib/peasy-input';>>main.ts

echo const model={};>>main.ts
echo const template=`^<div^> Hello Peasy!!! ^</div^>`;>>main.ts
echo UI.create(document.body, template, model);>>main.ts
echo UI.initialize(100/6);>>main.ts

:N2

echo console.log(`Hello World`);>>main.ts


cd ..
echo creating tsconfig.json file in root
echo {  >tsconfig.json
echo  "compilerOptions": { >>tsconfig.json
echo    "target": "ESNext",>>tsconfig.json
echo    "useDefineForClassFields": true,>>tsconfig.json
echo    "lib": ["ESNext", "DOM"],>>tsconfig.json
echo    "outDir": "./build/",>>tsconfig.json
echo    "sourceMap": true, >>tsconfig.json
echo    "noImplicitAny": true,>>tsconfig.json
echo    "module": "ESNext",>>tsconfig.json
echo    "target": "ESNext",>>tsconfig.json
echo    "jsx": "react",>>tsconfig.json
echo    "allowJs": true,>>tsconfig.json
echo    "moduleResolution": "Node",>>tsconfig.json
echo    "resolveJsonModule": true,>>tsconfig.json
echo    "esModuleInterop": true,>>tsconfig.json
echo    "skipLibCheck": true,>>tsconfig.json
echo    "isolatedModules": true,>>tsconfig.json
echo    "strict": true>>tsconfig.json
echo    }>>tsconfig.json
echo  }>>tsconfig.json


echo creating .gitignore file

echo node_modules>.gitignore
echo build>>.gitignore

echo creating /index.html

echo ^<!DOCTYPE html^> >index.html
echo ^<html lang="en"^> >>index.html
echo ^<head^> >>index.html
echo ^<meta charset="UTF-8"^> >>index.html
echo ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^> >>index.html
echo ^<title^>Hello VITE^</title^> >>index.html 
echo ^<script type="module" src="/src/main.ts"^> ^</script^> >>index.html  
echo ^</head^> >>index.html
echo ^<body^> >>index.html
echo ^</body^> >>index.html
echo ^</html^> >>index.html

cd src
echo creating /src/style.css
echo /*style.css*/ >style.css

cd ..
call npx json -I -f package.json -e "this.scripts.build='tsc && vite build'"
call npx json -I -f package.json -e "this.scripts.dev='vite'"
call npx json -I -f package.json -e "this.scripts.preview='vite preview'"

npm run dev
echo COMPLETED!!!!