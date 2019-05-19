# Urbaton2019

**Название приложения**: RecycleHero <br/>
**Направление**: Экология  <br/>

**Проблема**: мало людей сдают мусор в переработку. <br/>
**Решение**: геймифицировать этот процесс - за сдачу мусора в пункты приема ты получаешь баллы, затем по ним формируется рейтинг и ты получаешь уровни и достижения. <br/>

**Разработано**: Web и мобильное приложения <br/>
Ссылка на web приложение: (тут будет ссылка) <br/>
Файл мобильного приложения: (тут будет файл) <br/>
**ВАЖНО!** Для того, чтобы приложения могли запуститься, нужно быть в сети *kontur_сonf*. <br/>

**Подробное описание приложения**: <br/>
Web и мобильное приложения работают одинакого, сделано для удобства пользования. <br/>
Потенциальные пользователи приложения: те, кто сдают/будут сдавать мусор в переработку (далее *пользователи_1*), и те, кто принимает отсортированный мусор в пунктах приема (далее *пользователи_2*). <br/>

*Регистрация*: <br/>
  - пользователи_1 регистрируются по форме регистрации с подтверждением e-mail; <br/>
  - пользователям_2 будет предоставляться специальный аккаунт. *Аккаунт для провеки (логин/пароль)*: superadmin/superadmin <br/>

*Общий принцип работы*: <br/>
  - у пользователей_1 в приложении будет: <br/>
      - информация о приложении, чтобы пользователи смогли сразу разобраться в принципе работы; <br/>
      - информация о том, какой мусор нужно отдавать на переработку и почему это важно; <br/>
      - карта, на которой отмечены пункты приема отсортированного мусора, их можно отфильтровать по типам мусора, а также определить             ближайший к тебе пункт приема; <br/>
      - **начисление баллов** и **рейтинг** для повышения мотивации сортировать мусор и сдавать его на переработку, поощрения тех, кто           сдает мусор в переработку, а также для привлечения новых пользователей этим "соревнованием"; <br/>
      - личные достижения для лучшей мотивации.
  - У пользователей_2 в приложении будет: <br/>
      - система начисления баллов пользователям, которые принесли мусор в пункт переработки; <br/>
      - статистика по данному пункту приема (сколько принесли конкретных предметов в этот пункт). <br/>

*Принцип начисления баллов*:  <br/>
   1) Пользователь_1 приходит приносит в пункт примема отсортированный мусор. <br/> 
   2) Пользователь_2 взвешивает то, что принес пользователь_1. <br/>
   3) Пользователь_2 вносит информацию о весе и типе принесенного мусора (пользователь_2 должен быть под собой авторизован); <br/>
   4) Пользователь_2 нажимает на кнопку "Сгенерировать код". <br/>
   5) На основе введенных данных в п.3, приложение сгенерирует одноразовый шестизначный код, пользователь_2 должен сообщить пользователю_1 этот код. <br/>
   6) Пользователь_1 полученный код в п.5 вносит в свое приложение в графе "Ввести код". <br/>
   7) Пользователю_1 начисляются баллы, которые были вычислены из того, что и какой массы принес пользователь_1 в пункт приема мусор. <br/>

Таким образом, у всех пользователей будет начисляться честный рейтинг, по рейтингу по истечению какого-либо промежутка времени, например, год, будут награждены лучшие. Призами для лучших в этом рейтинге будут различные вещи, например, футболки.   


