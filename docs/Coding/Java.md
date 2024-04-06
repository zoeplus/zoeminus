安装和管理多个 java 版本.

[github](https://gist.github.com/ofhouse/b6cca8006329107fa0770a8dd87f45cf)

```shell
sudo apt --names-only search "openjdk-.*jre$"

sudo apt install openjdk-<version>-jre

java -version

sudo update-alternatives --config java
```

```shell
java -jar Minecraft.jar
```
