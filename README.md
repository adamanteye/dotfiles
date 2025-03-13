# dotfiles

这里是我自用的配置文件, 使用 GNU stow 配合管理.

## 从新系统中迁移

执行:

```sh
for i in $(ls -d */); do stow --target="$HOME" "$i"; done
```
