# This repository is vim config file ![reviewdog](https://github.com/kazukazuinaina/dotvim/workflows/vint/badge.svg?branch=master)

## Requirement

- Vim8 (Use packadd)

## Setting this dotfiles

```
$ git clone --recursive https://github.com/kazukazuinaina/dotvim.git ~/.vim
```

## Add plugin

you must transfar plugin's directory and do command below

```
$  git submodule add 'plugin name'
```

## Update repo

```
git pull && git submodule update --init --recursive
```

## Update plugin's command

do this command
    ```
    $ git submodule foreach git pull
    ```
or
    ```
    $ git submodule foreach git pull origin master
    ```

## References

> http://tyru.hatenablog.com/entry/2017/12/20/035142
