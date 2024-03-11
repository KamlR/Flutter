## News application on Flutter

### Для чего предназначено приложение:
Для просмотра новостей

Данные берутся из API: https://newsapi.org/

### Какую функциональность предоставляет приложение:
1. Просмотр ленты новостей в скроллящемся списке
   1.1 Каждая новость в ленте имеет заголовок, фото, дату публикации
   
2. Переход на дополнительный экран для просмотра более подробной информации по каждой новости
   Что содержится на экране новости:
     a. Фото
     b. Автор
     c. Кликабельную ссылку на ресурс
     d. Подробную информацию
     e. Информацию о контенте
3. Возможность менять тему приложения на отдельном экране (светлая и тёмная)
4. TabBar, которой позволяет перемещаться между скроллящимся экраном и экраном смены темы

### Визуализация экранов в разных темах
#### 1. Экран скроллинга новостей
   
   1.1 В светлой теме:

   <img width="292" alt="Снимок экрана 2024-02-19 в 19 54 48" src="https://github.com/KamlR/Flutter/assets/115434090/19232a57-65d4-4659-a4e2-c4f9d6e61cc0">

   1.2 В тёмной теме:
   
   <img width="289" alt="Снимок экрана 2024-02-19 в 19 57 12" src="https://github.com/KamlR/Flutter/assets/115434090/11e5409b-96d6-43a1-ac68-c0620a5e68c0">

#### 2. Экран с подробной информацией по каждой новости:
   
   1.1 В светлой теме:

   <img width="286" alt="Снимок экрана 2024-02-19 в 19 59 57" src="https://github.com/KamlR/Flutter/assets/115434090/416a6e60-be0b-456e-941e-e076db4d55cc">

   1.2 В тёмной теме:
   
   <img width="299" alt="Снимок экрана 2024-02-19 в 20 00 41" src="https://github.com/KamlR/Flutter/assets/115434090/83f99325-7e5f-44ea-930d-3b55782f4fd0">

#### 3. Экран смены темы приложения
   
   1.1 В светлой теме:

   <img width="289" alt="Снимок экрана 2024-02-19 в 20 05 28" src="https://github.com/KamlR/Flutter/assets/115434090/5d053a00-78bb-4a0c-8203-cd097690e6c4">

   1.2 В тёмной теме:
   
   <img width="284" alt="Снимок экрана 2024-02-19 в 20 06 02" src="https://github.com/KamlR/Flutter/assets/115434090/cceabc5a-9e0d-457f-a987-00174776f7cd">


### Немного по технической части:
### Работа с темой:
1. В файле theme.dart хранится файл, в котором прописаны стили элементов для тёмной темы и светлой темы
2. Есть отдельный класс ThemeProvider, который управялет сменой темы
3. При помощи notifyListeners(); уведомлдяем подписчиков о смене стили элементов

### Получение данных с сервера:
1. Для выполнения запроса к серверу используется Dio
2. Для превращения пришедших данных в удобный для работы вид используется json_serializable
   2.1 Для этого сгенерирован фалй news.g.dart, который занимается десериализацией
### Хранения данных
1. Данные хранятся в SharedPreferences
2. Хранится информации о теме приложения
3. При каждом запуске приложения извлекаем данные из SharedPreferences для установки выбранной темы
4. Если в кэше ничего нет, то по умолчанию ставим светлую тему пользователю


   