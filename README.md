# This repository is vim config file

## Requirement

[gopls](https://github.com/golang/go/wiki/gopls)

[pyls](https://github.com/palantir/python-language-server)

## setting this dotfiles

```
$ git clone --recursive https://github.com/kazukazuinaina/dotvim.git ~/.vim
```

## add plugin

you must transfar plugin's directory and do command below

```
$  git submodule add 'plugin name'
```

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

## References

> http://tyru.hatenablog.com/entry/2017/12/20/035142
