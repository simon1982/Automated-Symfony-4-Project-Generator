#!/bin/bash
echo    Automated Symfony 4 Project Generator
echo 	Copyright \(c\) 2002 - 2018 szymondomanski.com
echo
echo    Permission is hereby granted, free of charge, to any person obtaining
echo    a copy of this software and associated documentation files \(the "Software"\),
echo    to deal in the Software without restriction, including without limitation
echo    the rights to use, copy, modify, merge, publish, distribute, sublicense,
echo    and/or sell copies of the Software, and to permit persons to whom the Software
echo    is furnished to do so, subject to the following conditions:

echo    The above copyright notice and this permission notice shall be included in
echo    all copies or substantial portions of the Software.

echo    THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,
echo    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
echo    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
echo    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
echo    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
echo   	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
echo   	OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

echo 	This script will create the an empty ready to use Symfony 4 web project.
echo	Project will have all the necessary components.

echo 	Please enter project name:?

read name
echo Depending on the speed of your connection, the installation may be faster or slower.
echo 
echo 
echo 
echo Loading ...
composer create-project symfony/website-skeleton $name
cd $name
composer require symfony/apache-pack --no-interaction --assume-yes
composer require symfony/orm-pack
composer require symfony/maker-bundle --dev
composer require --dev symfony/profiler-pack
composer require symfony/security-bundle
composer require symfony/http-foundation
composer require encore
yarn install
yarn add sass-loader@^7.0.1 node-sass --dev
echo Do you want Twiter Bootstrap 4 installed \(y/n\)? 
read answer
if [ "$answer" == "y" ]
then
    yarn add bootstrap --dev
else 
    echo Bootstrap 4 will not be installed.
fi

