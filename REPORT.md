## Laboratory work VIII

Данная лабораторная работа посвещена изучению систем автоматизации развёртывания и управления приложениями на примере **Docker**

```sh
$ open https://docs.docker.com/get-started/
```

## Tasks

- [ ] 1. Создать публичный репозиторий с названием **lab08** на сервисе **GitHub**
- [ ] 2. Ознакомиться со ссылками учебного материала
- [ ] 3. Выполнить инструкцию учебного материала
- [ ] 4. Составить отчет и отправить ссылку личным сообщением в **Slack**


## Report

```sh
vadim@vadim-VirtualBox:~$ export GITHUB_USERNAME=polenk0
vadim@vadim-VirtualBox:~$ cd ${GITHUB_USERNAME}/workspace
vadim@vadim-VirtualBox:~/polenk0/workspace$ pushd .
~/polenk0/workspace ~/polenk0/workspace
vadim@vadim-VirtualBox:~/polenk0/workspace$ source scripts/activate
vadim@vadim-VirtualBox:~/polenk0/workspace$ git clone https://github.com/${GITHUB_USERNAME}/lab07 lab08
Клонирование в «lab08»...
remote: Enumerating objects: 85, done.
remote: Counting objects: 100% (85/85), done.
remote: Compressing objects: 100% (63/63), done.
remote: Total 85 (delta 20), reused 0 (delta 0), pack-reused 0
Получение объектов: 100% (85/85), 28.43 КиБ | 4.06 МиБ/с, готово.
Определение изменений: 100% (20/20), готово.
vadim@vadim-VirtualBox:~/polenk0/workspace$ cd lab08
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git submodule update --init
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git remote remove origin
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab08

vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat > Dockerfile <<EOF
> FROM ubuntu:18.04
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> RUN apt update
> RUN apt install -yy gcc g++ cmake
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> 
COPY . print/
> WORKDIR print
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> ENV LOG_PATH /home/logs/log.txt
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> VOLUME /home/logs
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> WORKDIR _install/bin
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat >> Dockerfile <<EOF
> ENTRYPOINT ./demo
> EOF
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ docker build -t logger .
Команда «docker» не найдена, но может быть установлена с помощью:
sudo snap install docker         # version 24.0.5, or
sudo apt  install docker.io      # version 24.0.5-0ubuntu1
sudo apt  install podman-docker  # version 4.7.2+ds1-2build1
См. 'snap info docker', чтобы посмотреть дополнительные версии.
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo snap install docker
[sudo] пароль для vadim: 
docker 24.0.5 от Canonical✓ установлен
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ docker build -t logger .
ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker build -t logger .
[+] Building 42.3s (10/13)                  docker:default
 => [internal] load .dockerignore                     0.0s
 => => transferring context: 2B                       0.0s
 => [internal] load build definition from Dockerfile  0.0s
 => => transferring dockerfile: 373B                  0.0s
 => [internal] load metadata for docker.io/library/u  1.9s
 => [1/9] FROM docker.io/library/ubuntu:18.04@sha256  3.9s
 => => resolve docker.io/library/ubuntu:18.04@sha256  0.0s
 => => sha256:152dc042452c496007f07c 1.33kB / 1.33kB  0.0s
 => => sha256:dca176c9663a7ba4c1f0e71098 424B / 424B  0.0s
 => => sha256:f9a80a55f492e823bf5d51 2.30kB / 2.30kB  0.0s
 => => sha256:7c457f213c7634afb95a 25.69MB / 25.69MB  2.7s
 => => extracting sha256:7c457f213c7634afb95a0fb2410  1.1s
 => [internal] load build context                     0.0s
 => => transferring context: 118.13kB                 0.0s
 => [2/9] RUN apt update                              6.6s
 => [3/9] RUN apt install -yy gcc g++ cmake          20.4s 
 => [4/9] COPY . print/                               0.0s 
 => [5/9] WORKDIR print                               0.0s 
 => ERROR [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD  9.3s 
------                                                     
 > [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install:                           
0.222 -- [hunter] Initializing Hunter workspace (a20151e4c0740ee7d0f9994476856d813cdead29)                            
0.222 -- [hunter]   https://github.com/cpp-pm/hunter/archive/v0.25.5.tar.gz
0.222 -- [hunter]   -> /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e
2.647 -- The C compiler identification is GNU 7.5.0
2.723 -- The CXX compiler identification is GNU 7.5.0
2.728 -- Check for working C compiler: /usr/bin/gcc
2.833 -- Check for working C compiler: /usr/bin/gcc -- works
2.834 -- Detecting C compiler ABI info
2.943 -- Detecting C compiler ABI info - done
2.949 -- Detecting C compile features
3.339 -- Detecting C compile features - done
3.343 -- Check for working CXX compiler: /usr/bin/c++
3.483 -- Check for working CXX compiler: /usr/bin/c++ -- works
3.484 -- Detecting CXX compiler ABI info
3.634 -- Detecting CXX compiler ABI info - done
3.643 -- Detecting CXX compile features
4.180 -- Detecting CXX compile features - done
4.183 -- [hunter] Calculating Toolchain-SHA1
6.120 -- [hunter] Calculating Config-SHA1
6.239 -- [hunter] HUNTER_ROOT: /root/.hunter
6.239 -- [hunter] [ Hunter-ID: a20151e | Toolchain-ID: 9b2c9d4 | Config-ID: 110e69a ]
6.362 -- [hunter] GTEST_ROOT: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Install (ver.: 1.14.0)
6.796 -- [hunter] Building GTest
6.811 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/cache.cmake
6.811 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/args.cmake
6.861 -- The C compiler identification is GNU 7.5.0
6.919 -- The CXX compiler identification is GNU 7.5.0
6.922 -- Check for working C compiler: /usr/bin/gcc
7.009 -- Check for working C compiler: /usr/bin/gcc -- works
7.010 -- Detecting C compile features
7.270 -- Detecting C compile features - done
7.272 -- Check for working CXX compiler: /usr/bin/c++
7.366 -- Check for working CXX compiler: /usr/bin/c++ -- works
7.367 -- Detecting CXX compile features
7.790 -- Detecting CXX compile features - done
7.831 -- Configuring done
7.836 -- Generating done
7.837 -- Build files have been written to: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/Build
7.889 Scanning dependencies of target GTest-Release
7.902 [  6%] Creating directories for 'GTest-Release'
7.987 [ 12%] Performing download step (download, verify and extract) for 'GTest-Release'
7.999 -- Downloading...
7.999    dst='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
7.999    timeout='none'
7.999 -- Using src='https://github.com/google/googletest/archive/v1.14.0.tar.gz'
8.624 -- [download 0% complete]
8.624 -- [download 1% complete]
8.625 -- [download 2% complete]
8.673 -- [download 3% complete]
8.674 -- [download 4% complete]
8.674 -- [download 5% complete]
8.720 -- [download 6% complete]
8.721 -- [download 7% complete]
8.722 -- [download 8% complete]
8.723 -- [download 9% complete]
8.724 -- [download 10% complete]
8.724 -- [download 11% complete]
8.767 -- [download 12% complete]
8.768 -- [download 13% complete]
8.769 -- [download 14% complete]
8.770 -- [download 15% complete]
8.771 -- [download 16% complete]
8.771 -- [download 17% complete]
8.772 -- [download 18% complete]
8.773 -- [download 19% complete]
8.774 -- [download 20% complete]
8.775 -- [download 21% complete]
8.775 -- [download 22% complete]
8.776 -- [download 23% complete]
8.816 -- [download 25% complete]
8.817 -- [download 27% complete]
8.818 -- [download 29% complete]
8.820 -- [download 31% complete]
8.821 -- [download 33% complete]
8.823 -- [download 35% complete]
8.824 -- [download 37% complete]
8.826 -- [download 39% complete]
8.864 -- [download 41% complete]
8.865 -- [download 43% complete]
8.867 -- [download 45% complete]
8.868 -- [download 46% complete]
8.868 -- [download 47% complete]
8.870 -- [download 49% complete]
8.871 -- [download 51% complete]
8.874 -- [download 52% complete]
8.960 -- [download 54% complete]
8.960 -- [download 55% complete]
8.962 -- [download 57% complete]
8.963 -- [download 59% complete]
8.965 -- [download 60% complete]
8.967 -- [download 62% complete]
8.967 -- [download 63% complete]
8.968 -- [download 65% complete]
8.970 -- [download 66% complete]
8.970 -- [download 68% complete]
8.972 -- [download 70% complete]
8.972 -- [download 71% complete]
9.007 -- [download 72% complete]
9.009 -- [download 74% complete]
9.010 -- [download 76% complete]
9.012 -- [download 78% complete]
9.013 -- [download 80% complete]
9.014 -- [download 82% complete]
9.014 -- [download 84% complete]
9.014 -- [download 86% complete]
9.015 -- [download 88% complete]
9.015 -- [download 90% complete]
9.015 -- [download 92% complete]
9.015 -- [download 94% complete]
9.015 -- [download 96% complete]
9.015 -- [download 98% complete]
9.015 -- [download 100% complete]
9.017 -- verifying file...
9.017        file='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
9.019 -- Downloading... done
9.044 -- extracting...
9.044      src='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
9.044      dst='/root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/Source'
9.045 -- extracting... [tar xfz]
9.083 -- extracting... [analysis]
9.083 -- extracting... [rename]
9.083 -- extracting... [clean up]
9.083 -- extracting... done
9.110 [ 18%] No patch step for 'GTest-Release'
9.142 [ 25%] No update step for 'GTest-Release'
9.178 [ 31%] Performing configure step for 'GTest-Release'
9.191 CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
9.191   CMake 3.13 or higher is required.  You are running version 3.10.2
9.191 
9.191 
9.191 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/cache.cmake
9.191 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/args.cmake
9.191 -- Configuring incomplete, errors occurred!
9.193 make[2]: *** [GTest-Release-prefix/src/GTest-Release-stamp/GTest-Release-configure] Error 1
9.193 CMakeFiles/GTest-Release.dir/build.make:109: recipe for target 'GTest-Release-prefix/src/GTest-Release-stamp/GTest-Release-configure' failed
9.193 CMakeFiles/Makefile2:67: recipe for target 'CMakeFiles/GTest-Release.dir/all' failed
9.193 make[1]: *** [CMakeFiles/GTest-Release.dir/all] Error 2
9.193 Makefile:83: recipe for target 'all' failed
9.193 make: *** [all] Error 2
9.196 
9.196 [hunter ** FATAL ERROR **] Build step failed (dir: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest
9.196 [hunter ** FATAL ERROR **] [Directory:/root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/projects/GTest]
9.196 
9.196 ------------------------------ ERROR -----------------------------
9.196     https://hunter.readthedocs.io/en/latest/reference/errors/error.external.build.failed.html
9.196 ------------------------------------------------------------------
9.196 
9.196 CMake Error at /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_error_page.cmake:12 (message):
9.196 Call Stack (most recent call first):
9.196   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_fatal_error.cmake:20 (hunter_error_page)
9.196   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_download.cmake:623 (hunter_fatal_error)
9.196   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/projects/GTest/hunter.cmake:335 (hunter_download)
9.196   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
9.196   CMakeLists.txt:24 (hunter_add_package)
9.196 
9.196 
9.204 -- Configuring incomplete, errors occurred!
9.204 See also "/print/_build/CMakeFiles/CMakeOutput.log".
------
Dockerfile:7
--------------------
   5 |     COPY . print/
   6 |     WORKDIR print
   7 | >>> RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
   8 |     RUN cmake --build _build
   9 |     RUN cmake --build _build --target install
--------------------
ERROR: failed to solve: process "/bin/sh -c cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install" did not complete successfully: exit code: 1
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo apt remove cmake
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Пакет «cmake» не установлен, поэтому не может быть удалён
Обновлено 0 пакетов, установлено 0 новых пакетов, для удаления отмечено 0 пакетов, и 5 пакетов не обновлено.
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo apt update
Сущ:1 http://ru.archive.ubuntu.com/ubuntu noble InRelease
Пол:2 http://ru.archive.ubuntu.com/ubuntu noble-updates InRelease [89,7 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu noble-backports InRelease [89,7 kB]
Пол:4 http://security.ubuntu.com/ubuntu noble-security InRelease [89,7 kB]
Пол:5 http://ru.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [31,7 kB]
Пол:6 http://ru.archive.ubuntu.com/ubuntu noble-updates/main Translation-en [10,1 kB]
Пол:7 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [18,8 kB]
Пол:8 http://ru.archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [6 504 B]
Пол:9 http://ru.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [5 812 B]
Пол:10 http://ru.archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [2 152 B]
Пол:11 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [29,7 kB]
Пол:12 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [9 156 B]
Пол:13 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [16,3 kB]
Пол:14 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [5 844 B]
Получено 405 kB за 1с (741 kB/s)                          
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Может быть обновлено 5 пакетов. Запустите «apt list --upgradable» для их показа.
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo apt install -y software-properties-common
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Уже установлен пакет software-properties-common самой новой версии (0.99.48).
software-properties-common помечен как установленный вручную.
Обновлено 0 пакетов, установлено 0 новых пакетов, для удаления отмечено 0 пакетов, и 5 пакетов не обновлено.
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo apt install cmake
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Будут установлены следующие дополнительные пакеты:
  cmake-data libjsoncpp25 librhash0
Предлагаемые пакеты:
  cmake-doc cmake-format elpa-cmake-mode ninja-build
Следующие НОВЫЕ пакеты будут установлены:
  cmake cmake-data libjsoncpp25 librhash0
Обновлено 0 пакетов, установлено 4 новых пакетов, для удаления отмечено 0 пакетов, и 5 пакетов не обновлено.
Необходимо скачать 13,6 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 49,1 MB.
Хотите продолжить? [Д/н] 
Пол:1 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 libjsoncpp25 amd64 1.9.5-6build1 [82,8 kB]
Пол:2 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 librhash0 amd64 1.4.3-3build1 [129 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 cmake-data all 3.28.3-1build7 [2 155 kB]
Пол:4 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 cmake amd64 3.28.3-1build7 [11,2 MB]
Получено 13,6 MB за 2с (7 184 kB/s)        
Выбор ранее не выбранного пакета libjsoncpp25:amd64.
(Чтение базы данных … на данный момент установлено 153230 ф
айлов и каталогов.)
Подготовка к распаковке …/libjsoncpp25_1.9.5-6build1_amd64.
deb …
Распаковывается libjsoncpp25:amd64 (1.9.5-6build1) …
Выбор ранее не выбранного пакета librhash0:amd64.
Подготовка к распаковке …/librhash0_1.4.3-3build1_amd64.deb
 …
Распаковывается librhash0:amd64 (1.4.3-3build1) …
Выбор ранее не выбранного пакета cmake-data.
Подготовка к распаковке …/cmake-data_3.28.3-1build7_all.deb
 …
Распаковывается cmake-data (3.28.3-1build7) …
Выбор ранее не выбранного пакета cmake.
Подготовка к распаковке …/cmake_3.28.3-1build7_amd64.deb …
Распаковывается cmake (3.28.3-1build7) …
Настраивается пакет libjsoncpp25:amd64 (1.9.5-6build1) …
Настраивается пакет librhash0:amd64 (1.4.3-3build1) …
Настраивается пакет cmake-data (3.28.3-1build7) …
Настраивается пакет cmake (3.28.3-1build7) …
Обрабатываются триггеры для man-db (2.12.0-4build2) …
Обрабатываются триггеры для libc-bin (2.39-0ubuntu8.1) …
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cmake --version
cmake version 3.28.3

CMake suite maintained and supported by Kitware (kitware.com/cmake).
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker build -t logger .
[+] Building 9.3s (10/13)                   docker:default
 => [internal] load build definition from Dockerfile  0.0s
 => => transferring dockerfile: 373B                  0.0s
 => [internal] load .dockerignore                     0.0s
 => => transferring context: 2B                       0.0s
 => [internal] load metadata for docker.io/library/u  0.9s
 => [1/9] FROM docker.io/library/ubuntu:18.04@sha256  0.0s
 => [internal] load build context                     0.0s
 => => transferring context: 2.95kB                   0.0s
 => CACHED [2/9] RUN apt update                       0.0s
 => CACHED [3/9] RUN apt install -yy gcc g++ cmake    0.0s
 => CACHED [4/9] COPY . print/                        0.0s
 => CACHED [5/9] WORKDIR print                        0.0s
 => ERROR [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD  8.3s
------                                                     
 > [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install:                           
0.218 -- [hunter] Initializing Hunter workspace (a20151e4c0740ee7d0f9994476856d813cdead29)                            
0.218 -- [hunter]   https://github.com/cpp-pm/hunter/archive/v0.25.5.tar.gz
0.218 -- [hunter]   -> /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e
2.492 -- The C compiler identification is GNU 7.5.0
2.550 -- The CXX compiler identification is GNU 7.5.0
2.554 -- Check for working C compiler: /usr/bin/gcc
2.635 -- Check for working C compiler: /usr/bin/gcc -- works
2.636 -- Detecting C compiler ABI info
2.720 -- Detecting C compiler ABI info - done
2.725 -- Detecting C compile features
2.996 -- Detecting C compile features - done
3.000 -- Check for working CXX compiler: /usr/bin/c++
3.118 -- Check for working CXX compiler: /usr/bin/c++ -- works
3.119 -- Detecting CXX compiler ABI info
3.258 -- Detecting CXX compiler ABI info - done
3.265 -- Detecting CXX compile features
3.823 -- Detecting CXX compile features - done
3.826 -- [hunter] Calculating Toolchain-SHA1
5.235 -- [hunter] Calculating Config-SHA1
5.355 -- [hunter] HUNTER_ROOT: /root/.hunter
5.355 -- [hunter] [ Hunter-ID: a20151e | Toolchain-ID: 9b2c9d4 | Config-ID: 110e69a ]
5.485 -- [hunter] GTEST_ROOT: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Install (ver.: 1.14.0)
5.899 -- [hunter] Building GTest
5.914 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/cache.cmake
5.914 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/args.cmake
5.968 -- The C compiler identification is GNU 7.5.0
6.025 -- The CXX compiler identification is GNU 7.5.0
6.029 -- Check for working C compiler: /usr/bin/gcc
6.112 -- Check for working C compiler: /usr/bin/gcc -- works
6.113 -- Detecting C compile features
6.372 -- Detecting C compile features - done
6.375 -- Check for working CXX compiler: /usr/bin/c++
6.467 -- Check for working CXX compiler: /usr/bin/c++ -- works
6.468 -- Detecting CXX compile features
6.898 -- Detecting CXX compile features - done
6.939 -- Configuring done
6.943 -- Generating done
6.945 -- Build files have been written to: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/Build
6.997 Scanning dependencies of target GTest-Release
7.010 [  6%] Creating directories for 'GTest-Release'
7.096 [ 12%] Performing download step (download, verify and extract) for 'GTest-Release'
7.107 -- Downloading...
7.107    dst='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
7.107    timeout='none'
7.107 -- Using src='https://github.com/google/googletest/archive/v1.14.0.tar.gz'
8.064 -- verifying file...
8.064        file='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
8.065 -- Downloading... done
8.096 -- extracting...
8.096      src='/root/.hunter/_Base/Download/GTest/1.14.0/2b28c2a/v1.14.0.tar.gz'
8.096      dst='/root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/Source'
8.096 -- extracting... [tar xfz]
8.135 -- extracting... [analysis]
8.136 -- extracting... [rename]
8.136 -- extracting... [clean up]
8.136 -- extracting... done
8.160 [ 18%] No patch step for 'GTest-Release'
8.196 [ 25%] No update step for 'GTest-Release'
8.231 [ 31%] Performing configure step for 'GTest-Release'
8.243 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/cache.cmake
8.243 loading initial cache file /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest/args.cmake
8.243 CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
8.243   CMake 3.13 or higher is required.  You are running version 3.10.2
8.243 
8.243 
8.243 -- Configuring incomplete, errors occurred!
8.245 make[2]: *** [GTest-Release-prefix/src/GTest-Release-stamp/GTest-Release-configure] Error 1
8.245 CMakeFiles/GTest-Release.dir/build.make:109: recipe for target 'GTest-Release-prefix/src/GTest-Release-stamp/GTest-Release-configure' failed
8.245 make[1]: *** [CMakeFiles/GTest-Release.dir/all] Error 2
8.245 CMakeFiles/Makefile2:67: recipe for target 'CMakeFiles/GTest-Release.dir/all' failed
8.245 Makefile:83: recipe for target 'all' failed
8.245 make: *** [all] Error 2
8.247 
8.247 [hunter ** FATAL ERROR **] Build step failed (dir: /root/.hunter/_Base/a20151e/9b2c9d4/110e69a/Build/GTest
8.247 [hunter ** FATAL ERROR **] [Directory:/root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/projects/GTest]
8.247 
8.247 ------------------------------ ERROR -----------------------------
8.247     https://hunter.readthedocs.io/en/latest/reference/errors/error.external.build.failed.html
8.247 ------------------------------------------------------------------
8.247 
8.248 CMake Error at /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_error_page.cmake:12 (message):
8.248 Call Stack (most recent call first):
8.248   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_fatal_error.cmake:20 (hunter_error_page)
8.248   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_download.cmake:623 (hunter_fatal_error)
8.248   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/projects/GTest/hunter.cmake:335 (hunter_download)
8.248   /root/.hunter/_Base/Download/Hunter/0.25.5/a20151e/Unpacked/cmake/modules/hunter_add_package.cmake:62 (include)
8.248   CMakeLists.txt:24 (hunter_add_package)
8.248 
8.248 
8.254 -- Configuring incomplete, errors occurred!
8.254 See also "/print/_build/CMakeFiles/CMakeOutput.log".
------
Dockerfile:7
--------------------
   5 |     COPY . print/
   6 |     WORKDIR print
   7 | >>> RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
   8 |     RUN cmake --build _build
   9 |     RUN cmake --build _build --target install
--------------------
ERROR: failed to solve: process "/bin/sh -c cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install" did not complete successfully: exit code: 1
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker build -t logger .
[+] Building 0.9s (10/13)                   docker:default
 => [internal] load build definition from Dockerfile  0.0s
 => => transferring dockerfile: 373B                  0.0s
 => [internal] load .dockerignore                     0.0s
 => => transferring context: 2B                       0.0s
 => [internal] load metadata for docker.io/library/u  0.6s
 => [1/9] FROM docker.io/library/ubuntu:18.04@sha256  0.0s
 => [internal] load build context                     0.0s
 => => transferring context: 4.97kB                   0.0s
 => CACHED [2/9] RUN apt update                       0.0s
 => CACHED [3/9] RUN apt install -yy gcc g++ cmake    0.0s
 => [4/9] COPY . print/                               0.0s
 => [5/9] WORKDIR print                               0.0s
 => ERROR [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD  0.2s
------                                                     
 > [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install:                           
0.184 CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
0.184   CMake 3.28.3 or higher is required.  You are running version 3.10.2
0.184 
0.184 
0.184 -- Configuring incomplete, errors occurred!
------
Dockerfile:7
--------------------
   5 |     COPY . print/
   6 |     WORKDIR print
   7 | >>> RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
   8 |     RUN cmake --build _build
   9 |     RUN cmake --build _build --target install
--------------------
ERROR: failed to solve: process "/bin/sh -c cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install" did not complete successfully: exit code: 1
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker build -t logger .
[+] Building 91.6s (17/17) FINISHED         docker:default
 => [internal] load .dockerignore                     0.0s
 => => transferring context: 2B                       0.0s
 => [internal] load build definition from Dockerfile  0.0s
 => => transferring dockerfile: 621B                  0.0s
 => [internal] load metadata for docker.io/library/u  1.2s
 => [ 1/12] FROM docker.io/library/ubuntu:20.04@sha2  4.2s
 => => resolve docker.io/library/ubuntu:20.04@sha256  0.0s
 => => sha256:874aca52f79ae5f8258faf 1.13kB / 1.13kB  0.0s
 => => sha256:cc9cc8169c9517ae035cf293b1 424B / 424B  0.0s
 => => sha256:2abc4dfd83182546da40df 2.29kB / 2.29kB  0.0s
 => => sha256:d4c3c94e5e10ed15503b 27.51MB / 27.51MB  2.9s
 => => extracting sha256:d4c3c94e5e10ed15503bda7e145  1.2s
 => [internal] load build context                     0.0s
 => => transferring context: 3.54kB                   0.0s
 => [ 2/12] RUN apt-get update && apt-get install -  43.1s
 => [ 3/12] RUN apt-get remove -y cmake               1.6s 
 => [ 4/12] RUN wget https://github.com/Kitware/CMak  6.6s 
 => [ 5/12] RUN chmod +x cmake-3.28.3-linux-x86_64.s  0.9s 
 => [ 6/12] RUN ./cmake-3.28.3-linux-x86_64.sh --ski  2.7s 
 => [ 7/12] RUN apt-get install -y     gcc     g++    1.6s 
 => [ 8/12] COPY . /print/                            0.1s 
 => [ 9/12] WORKDIR /print                            0.0s 
 => [10/12] RUN cmake -H. -B_build -DCMAKE_BUILD_TY  26.3s 
 => [11/12] RUN cmake --build _build                  1.0s 
 => [12/12] RUN cmake --build _build --target instal  0.4s 
 => exporting to image                                1.8s 
 => => exporting layers                               1.8s 
 => => writing image sha256:1e9d8f32d3eebaa03838a28b  0.0s 
 => => naming to docker.io/library/logger             0.0s 
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ docker images
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/images/json": dial unix /var/run/docker.sock: connect: permission denied
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker images
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
logger       latest    1e9d8f32d3ee   About a minute ago   666MB
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ mkdir logs
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ docker run -it -v "$(pwd)/logs/:/home/logs/" logger
docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker run -it -v "$(pwd)/logs/:/home/logs/" logger
root@90576b9ad55b:/print# text1
bash: text1: command not found
root@90576b9ad55b:/print# <C-D>
bash: syntax error near unexpected token `newline'
root@90576b9ad55b:/print# 
root@90576b9ad55b:/print# 
root@90576b9ad55b:/print# exit
exit
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ docker run -it -v "$(pwd)/logs/:/home/logs/" logger
text1
text2
text3
<C-D>
docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
text1: команда не найдена
text2: команда не найдена
text3: команда не найдена
bash: синтаксическая ошибка рядом с неожиданным маркером «newline»
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker run -it -v "$(pwd)/logs/:/home/logs/" logger /bin/bash -c "echo text1 && echo text2 && echo text3"
text1
text2
text3
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo docker inspect logger
[
    {
        "Id": "sha256:1e9d8f32d3eebaa03838a28ba0b327fdb8857e967f1bc5596fa8110b541931cb",
        "RepoTags": [
            "logger:latest"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2024-05-19T20:57:04.715213299+03:00",
        "Container": "",
        "ContainerConfig": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": null,
            "Cmd": null,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "",
            "Volumes": null,
            "WorkingDir": "/print",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "20.04"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 665945903,
        "VirtualSize": 665945903,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/snap/docker/common/var-lib-docker/overlay2/6vvlu451o64nqleq3urw0j97g/diff:/var/snap/docker/common/var-lib-docker/overlay2/qzhy1c1bxtisa09wzbi14fiwd/diff:/var/snap/docker/common/var-lib-docker/overlay2/yfoksevljhc68smjy0u4elw3k/diff:/var/snap/docker/common/var-lib-docker/overlay2/xjowodb5lxyqjv6wpe5vx0pw2/diff:/var/snap/docker/common/var-lib-docker/overlay2/tc1m4w12mn8x0qa442rxtng5t/diff:/var/snap/docker/common/var-lib-docker/overlay2/uftet4vz98nwsh5cw1q8somlx/diff:/var/snap/docker/common/var-lib-docker/overlay2/5ypf1e4x6y7xaq9pwhdyi5yft/diff:/var/snap/docker/common/var-lib-docker/overlay2/jpnmj0jqrgit4q220c1f4gs2r/diff:/var/snap/docker/common/var-lib-docker/overlay2/xb1mizymz0hn0fzwqobverfo4/diff:/var/snap/docker/common/var-lib-docker/overlay2/dogyrlahxdqo1i7figiaa26ed/diff:/var/snap/docker/common/var-lib-docker/overlay2/3ef34fe237f473bfd99195f288b9e5ee7506ba90411d6a05603fb39ad119672d/diff",
                "MergedDir": "/var/snap/docker/common/var-lib-docker/overlay2/y85fbpw9w17vy0cxmfv9eyri2/merged",
                "UpperDir": "/var/snap/docker/common/var-lib-docker/overlay2/y85fbpw9w17vy0cxmfv9eyri2/diff",
                "WorkDir": "/var/snap/docker/common/var-lib-docker/overlay2/y85fbpw9w17vy0cxmfv9eyri2/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:4a1518ebc26e2e4c26f1c5d78a36d41d87d2fd4a7e4ad37c5f9033f2eb52f26b",
                "sha256:e7862ec8215499cb5cf1ae4f2feaf6aae1454e1407185a46138ec8200c3874f7",
                "sha256:ac719866ec60bc4e8c83b52115b5792fad3c67f0d7a4d54ab632bdb4391ca724",
                "sha256:8912ac9cc209f6b4f0dd849e9540fdd74d0cbe23a1b94c3355d19a2eeae33ada",
                "sha256:8f45e0eb17149e1a0c62e735683d6b48c3d4f19391c7eb05cd6996e1daf4c2ce",
                "sha256:b739d6e57135b61f9ebbb4ce320a7e98097250deb0210dbede5a485b0ea9ea2e",
                "sha256:415d518ca5233827863b0099928f864e3577b9155bcdb1860c24042872c9d5b3",
                "sha256:31b586cc3ca0aee48c8432b3e810099f584e3e41ad42a4c20e147d0ff3c18d7c",
                "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef",
                "sha256:d53c34c3352ae850f2032d91f3eebda5b09f4a3a1dab79b74ad66b8a15c7a6bb",
                "sha256:9b8ecbae0f2dddf49644b33c1df90626d974267b7a5792c1a6e07c68de152751",
                "sha256:46fc83956c2d2f05ea8076cf84fb73142c51032975517e8e9431edcaf6e36db7"
            ]
        },
        "Metadata": {
            "LastTagTime": "2024-05-19T20:57:06.516845329+03:00"
        }
    }
]
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat logs/log.txt
cat: logs/log.txt: Нет такого файла или каталога
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ cat logs/log.txt
cat: logs/log.txt: Нет такого файла или каталога
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ gsed -i 's/lab07/lab08/g' README.md
Команда «gsed» не найдена. Возможно, вы имели в виду:
  команда 'gsec' из deb-пакета firebird3.0-utils (3.0.11.33637.ds4-2ubuntu2)
  команда 'gted' из deb-пакета gnome-text-editor (45.1-1build1)
  команда 'gsnd' из deb-пакета ghostscript (10.02.1~dfsg1-0ubuntu1)
  команда 'gsad' из deb-пакета gsad (22.8.0-1)
  команда 'gsd' из deb-пакета python3-gsd (3.0.1-3build1)
  команда 'sed' из deb-пакета sed (4.9-2)
  команда 'msed' из deb-пакета mblaze (1.1-1)
  команда 'ssed' из deb-пакета ssed (3.62-8)
Попробуйте: sudo apt install <имя_deb-пакета>
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sed -i 's/lab07/lab08/g' README.md
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ vim .travis.yml
Команда «vim» не найдена, но может быть установлена с помощью:
sudo apt install vim        # version 2:9.0.2189-1ubuntu1, or
sudo apt install neovim     # version 0.7.2-8
sudo apt install vim-gtk3   # version 2:9.0.2189-1ubuntu1
sudo apt install vim-motif  # version 2:9.0.2189-1ubuntu1
sudo apt install vim-nox    # version 2:9.0.2189-1ubuntu1
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ sudo apt install vim
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Будут установлены следующие дополнительные пакеты:
  libsodium23 vim-runtime
Предлагаемые пакеты:
  ctags vim-doc vim-scripts
Следующие НОВЫЕ пакеты будут установлены:
  libsodium23 vim vim-runtime
Обновлено 0 пакетов, установлено 3 новых пакетов, для удаления отмечено 0 пакетов, и 5 пакетов не обновлено.
Необходимо скачать 9 321 kB архивов.
После данной операции объём занятого дискового пространства возрастёт на 42,0 MB.
Хотите продолжить? [Д/н] 
Пол:1 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 libsodium23 amd64 1.0.18-1build3 [161 kB]
Пол:2 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 vim-runtime all 2:9.1.0016-1ubuntu7 [7 279 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu noble/main amd64 vim amd64 2:9.1.0016-1ubuntu7 [1 880 kB]
Получено 9 321 kB за 1с (10,4 MB/s)        
Выбор ранее не выбранного пакета libsodium23:amd64.
(Чтение базы данных … на данный момент установлено 156639 ф
айлов и каталогов.)
Подготовка к распаковке …/libsodium23_1.0.18-1build3_amd64.
deb …
Распаковывается libsodium23:amd64 (1.0.18-1build3) …
Выбор ранее не выбранного пакета vim-runtime.
Подготовка к распаковке …/vim-runtime_2%3a9.1.0016-1ubuntu7
_all.deb …
Добавляется «отклонение /usr/share/vim/vim91/doc/help.txt в
 /usr/share/vim/vim91/doc/help.txt.vim-tiny из-за vim-runti
me»
Добавляется «отклонение /usr/share/vim/vim91/doc/tags в /us
r/share/vim/vim91/doc/tags.vim-tiny из-за vim-runtime»
Распаковывается vim-runtime (2:9.1.0016-1ubuntu7) …
Выбор ранее не выбранного пакета vim.
Подготовка к распаковке …/vim_2%3a9.1.0016-1ubuntu7_amd64.d
eb …
Распаковывается vim (2:9.1.0016-1ubuntu7) …
Настраивается пакет libsodium23:amd64 (1.0.18-1build3) …
Настраивается пакет vim-runtime (2:9.1.0016-1ubuntu7) …
Настраивается пакет vim (2:9.1.0016-1ubuntu7) …
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/ex (ex) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/rview (rview) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/rvim (rvim) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/vi (vi) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/view (view) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/vim (vim) в автоматическом режиме
update-alternatives: используется /usr/bin/vim.basic для пр
едоставления /usr/bin/vimdiff (vimdiff) в автоматическом ре
жиме
Обрабатываются триггеры для man-db (2.12.0-4build2) …
Обрабатываются триггеры для libc-bin (2.39-0ubuntu8.1) …
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ vim .travis.yml

[1]+  Остановлен    vim .travis.yml
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ vim .travis.yml

[2]+  Остановлен    vim .travis.yml
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git add Dockerfile
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git add .travis.yml
fatal: спецификатор пути «.travis.yml» не соответствует ни одному файлу
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git commit -m"adding Dockerfile"
[main bc20a25] adding Dockerfile
 1 file changed, 21 insertions(+)
 create mode 100644 Dockerfile
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git push origin master
error: src refspec master ничему не соответствует
error: не удалось отправить некоторые ссылки в «https://github.com/polenk0/lab08»
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ git push origin main
Перечисление объектов: 88, готово.
Подсчет объектов: 100% (88/88), готово.
При сжатии изменений используется до 8 потоков
Сжатие объектов: 100% (46/46), готово.
Запись объектов: 100% (88/88), 28.95 КиБ | 28.95 МиБ/с, готово.
Всего 88 (изменений 21), повторно использовано 84 (изменений 20), повторно использовано пакетов 0
remote: Resolving deltas: 100% (21/21), done.
To https://github.com/polenk0/lab08
 * [new branch]      main -> main
vadim@vadim-VirtualBox:~/polenk0/workspace/lab08$ popd
~/polenk0/workspace
vadim@vadim-VirtualBox:~/polenk0/workspace$ export LAB_NUMBER=08
vadim@vadim-VirtualBox:~/polenk0/workspace$ git clone https://github.com/tp-labs/lab${LAB_NUMBER} tasks/lab${LAB_NUMBER}
Клонирование в «tasks/lab08»...
remote: Enumerating objects: 76, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 76 (delta 0), reused 0 (delta 0), pack-reused 73
Получение объектов: 100% (76/76), 951.66 КиБ | 583.00 КиБ/с, готово.
Определение изменений: 100% (22/22), готово.
vadim@vadim-VirtualBox:~/polenk0/workspace$ mkdir reports/lab${LAB_NUMBER}
vadim@vadim-VirtualBox:~/polenk0/workspace$ cp tasks/lab${LAB_NUMBER}/README.md reports/lab${LAB_NUMBER}/REPORT.md
vadim@vadim-VirtualBox:~/polenk0/workspace$ cd reports/lab${LAB_NUMBER}
vadim@vadim-VirtualBox:~/polenk0/workspace/reports/lab08$ edit REPORT.md

[3]+  Остановлен    edit REPORT.md
vadim@vadim-VirtualBox:~/polenk0/workspace/reports/lab08$ gist REPORT.md

```

## Links

- [Book](https://www.dockerbook.com)
- [Instructions](https://docs.docker.com/engine/reference/builder/)

```
Copyright (c) 2015-2021 The ISC Authors
```
