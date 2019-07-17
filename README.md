# This repository is vim config file

## update repo
```
git pull
git submodule update --init --recursive
```

## update plugin's command

do this command
    ```
    $ git submodule foreach git pull
    ```
or
    ```
    $ git submodule foreach git pull origin master
    ```

## add plugin

you must transfar plugin's directory and do command below

```
$  git submodule add 'plugin name'
```

## setting this dotfiles

1. 
    ```
    $ git clone --recursive https://github.com/kazukazuinaina/dotfiles.git
    ```
2. 
    ```
    $ sh dotfilesLink.sh
    ```
## References

> http://tyru.hatenablog.com/entry/2017/12/20/035142
