# Books 

## Install dependencies

```bash
bundle install
```

## Prepare DB

```bash
rake db:create
rake db:migrate
rake db:seed
```

## Run application

```bash
shotgun -p 9292
```

## Use for db versions

```pry
(Time.now.to_f * 1000).to_i
```
