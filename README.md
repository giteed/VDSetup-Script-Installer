# VDSetup (Для ознакомления и ТОЛЬКО для тестовых VDS)

- НЕ ПРЕДНАЗНАЧЕН ДЛЯ РАБОЧИХ СЕРВЕРОВ! 
  (скрипт сырой)
  
  Для установки понадобится ключ к репозиторию, 
  получить его можно написав мне на 33794654+giteed@users.noreply.github.com  

 # Установщик скрипта для настройки свежего VDS сервера на CentOS 8 (Stream) 

  Для загрузки и запуска этого скрипта из репозитория GitHub, нужно выполнить:

  (Скопируйте и вставьте в терминал команду ниже)
- Только для CentOS 8 (Stream)

  (rm -rf /root/.VDSInstaller ~/bin/* ) 2>/dev/null ; (dnf -y install rsync rsync-daemon git mc) &>/devnull ; (echo); (git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ; (/root/.VDSInstaller/bin/utility/preloader.sh) ;

  ---------------------------------------------
  В команде выше содержатся следующие действия:
  =============================================

- Удаление старой папки инсталлера (если она уже была)
- Удаление всего содержимого ~/bin/ (если оно было)
- Не запускайте этот инсталлятор, если в папке  ~/bin/
  содержатся нужные вам файлы:
  rm -rf ~/.VDSInstaller ~/bin/* ;

- Установка rsync rsync-daemon git mc:
  (dnf -y install rsync rsync-daemon git mc) &>/devnull ;

- Клонирование репо с GitHub в локальный репо:
  (git clone https://github.com/giteed/VDSInstaller.git ~/.VDSInstaller) ;

- Запуск установщика:
  (~/.VDSInstaller/preloader.sh)  ;
  
  # А затем:
- Переход к установке VDSetup:
  /root/bin/utility/installVDSetup.sh ;

  
 - Спасибо за проявленный интерес! :)
  
