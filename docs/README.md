Итак, опять зима, на улицу выходить совершенно не хочется - 


Нам потребуется 

1. Учетная запись на Github.
2. Бесплатный или платный, домен (и права управления ДНС конфигурацией).
3. 

* создаем репозиторий на Github. Имя может быть любое.

<img src="pic/01-create-github-repo.png" alt="drawing" width="800"/>


2. клонируем его локально

```
max@max $ git clone git@github.com:shaposhnikoff/bm-contacts.git
Cloning into 'bm-contacts'...
Warning: Permanently added 'github.com,140.82.121.4' (RSA) to the list of known hosts.
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
```

Добавляем в репозиторий скрипт, который будет генерировать CSV файлы и логику Github Actions, которая будет периодически 
запускать скрипт, коммитить изменения в репозиторий и формировать index.html

[brandmeister-digital-contacts](./../brandmeister-digital-contacts.py)

Для того, чтобы Github Action script мог закоммитить сгенерированые файлы в репозиторий, необходимо указать две переменные 
окружения для git - это USERNAME и EMAIL. 

Эти переменные используются вот так

```
git config user.name ${{ secrets.USERNAME }}
git config user.email ${{ secrets.EMAIL }}
```

Заходим в настройки репозитория, settings/secrets/actions

<img src="pic/02-create-secrets.png" alt="drawing" width="800"/>

нажимаем New Repository Secret и заполняем соответствующие поля. 

![username](pic/secrets_username.png)
![email](pic/secrets_email.png)



В данном случае, эти переменные используются в качестве 
исключительно информационном, никто не мешает заполнить их неправильно или некорректно,более того, необходимо чтобы 
конфигурационный файл .gitconfig выглядел следующим образом

```
[user]
	email = username@domain.com
	name = Username Lastname
```
Итак, мы заполнили необходимые поля - возвращаемся назад.

В большинстве случаев, Github Actions после этих настроек начинают работать, и мы можем видеть зеленый статус 
выполнения 

<img src="pic/gh_actions_almost_green.png" alt="drawing" width="800"/>

На данном этапе мы закончили с логикой генерации файлов и переходим к настройке ВебСервисов

Заходим в settings --> Github Pages ( далее GP ). По умолчанию GP отключены для всякого репозитория, их необходимо включить
Для того, чтобы их включить мы должны указать ветку (branch) - в котором содержатся наши html файлы для отображения - у нас это **main** и каталог, в котором находятся наш index.html - это **root** 


<img src="pic/gh_initial_setup.png" alt="drawing" width="800"/>

Далее, сохраняем изменения и у нас появляется поле для ввода Custom Domain


<img src="pic/gh_custom_domain.png" alt="drawing" width="800"/>

Домен .cf можно зарегистрировать совершенно [бесплатно](http://freenom.com) на срок до 1 года, для тестовых задач этого вполне достаточно.

И при переходе на [http://bm-contacts.ut3udx.cf](http://bm-contacts.ut3udx.cf) открывается такая страница


![bm-contacts](pic/html_page.png)

