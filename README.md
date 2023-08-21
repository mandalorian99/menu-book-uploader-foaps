# README
### Screenshots 
1. Dedicate importer with live status of job
![image](https://github.com/mandalorian99/menu-book-uploader-foaps/assets/35068786/f5d91292-8e92-4305-ae92-e353e9654c6a)


2. Log error and backtrace
![image](https://github.com/mandalorian99/menu-book-uploader-foaps/assets/35068786/4969a828-50b0-46b1-b769-436f3054d308)

3. Menu list
![image](https://github.com/mandalorian99/menu-book-uploader-foaps/assets/35068786/0900382b-5876-479d-8b03-4a8211300206)

### Dependencies & versions

```
ruby: ruby-3.1.3
rails: Rails 7.0.7

# dependencies
Redis server v=7.0.12
postres : >= 10.x

``` 

## Setup Project

#### 1. Clone repo 
```
 git clone git@github.com:mandalorian99/menu-book-uploader-foaps.git
```

#### Install app
```
$ bundle install
```
####  Add credentials

open our credentials file 
```
EDITOR=nano rails credentials:edit
``` 
and add below creds 

```
APP:
  host: http://localhost:3000

DB:
  username: postgres
  password: postgres
```

#### Database setup 
navigate to your database config file `config/database.yml`

change username and password to your local postgres instance creds 
or you can setup in cred file and use it here like . 

Default username and password is set for `postgres` and `postgres` for ease of use in local development . 

```
development:
  <<: *default
  database: menu_book_uploader_foaps_development
  username: Rails.application.credentials.dig(:DB, :username)
  password: Rails.application.credentials.dig(:DB, :username)
```

then migrate

```
$ rails db:migrate
```


#### Important url 
didn't got change put a nice navigation , here are two importnat urls

> view menu items and CRUD
menu: http://localhost:3000/menus

> view Import status and CRUD
import : http://localhost:3000/imports/
