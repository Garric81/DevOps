# Демо для курса по Docker

Сборка сервиса
```
docker build -t test -f apps/api/Dockerfile .


Установка для Debian 10
Для начала обновим наши репозитории:

sudo apt update

И установим необходимые для скачивания утилиты:

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

Далее скопируем с сайта публичный gpg-ключ:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Добавляем директорию для скачивания docker-а:

sudo add-apt-repository “deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable”

Далее проверяем наличие в кеше и устанавливаем Docker:

apt-cache policy docker-ce

apt install docker-ce

Наиболее используемые опции в контейнере Docker:
-ti – teletype (эмуляция входа в контейнер) и interactive (будем в эмуляции, пока сами не выйдем)
-e – прописать переменные окружения в /etc/hosts
-d – запустить в фоновом режиме (демоном)
--link – подключение по сети двух контейнеров, legacy функция
-p – используется для проброса портов

Наиболее используемые команды Docker:
docker pull имя образа – скачивание образа
docker ps – используется для просмотра активных контейнеров
docker run * -v /home/mount/data:/var/lib/mysql/data – примонтировать директорию на хосте в docker; в Docker Compose сначала указывается docker путь, потом хост путь
docker network ls – показать сети docker
docker network inspect [имя сети] – посмотреть конфигурацию сети
docker rm [имя] – удалить контейнер
docker rmi [имя] – удалить image

Примеры
docker pull mariadb – скачиваем контейнер mariadb:

docker images – просмотрим информацию о нашем скаченном образе:

docker run -p 127.0.0.1:3306:3306 --name mariadb4 -e MARIADB_ROOT_PASSWORD=superpass -d mariadb – запустим контейнер с пробросом порта 3306 наружу контейнера, именем mariadb и root-паролем:

docker ps – посмотрим список запущенных контейнеров:

docker run --name adminer4 --link mariadb4:db -p 8080:8080 -d adminer – запустим еще один контейнер и свяжем его с предыдущим по сети:


docker exec -ti adminer4 sh – подключимся к контейнеру с помощью оболочки sh:

docker stop имя запущенного контейнера – остановим наши запущенные контейнеры:

docker ps -a – вывести все контейнеры(и запущенные, и не запущенные):

docker rm имя контейнера – удалить контейнер:


docker rmi имя образа – удалить image:

```