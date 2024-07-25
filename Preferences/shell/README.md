# shell

一些自制实用 shell 脚本

## .modtools

### Usage

1. 拷贝工具目录到 $HOME 或创建软链接到 $HOME

```bash
cp -r .modtools ~
```

2. 在 .zshrc 或 .bashrc 中添加命令别名

```bash
alias g="source ~/.modtools/goto.sh
```

3. 在 goto.sh 中配置所需的目标目录

4. 使用 g 直达目录吧
