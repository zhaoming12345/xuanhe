# 项目介绍
这是一个自制的操作系统名为“xuanhe”。

## 编译要求

- NASM 汇编器
- GCC 编译器（支持32位编译）
- GNU Make

## 编译步骤

```bash
make
```

## 运行方法

使用 QEMU 运行：

```bash
qemu-system-i386 -hda os.img
```

## 文件说明

- mbr.asm: 主引导记录代码
- kernel.c: 内核代码
- kernel.ld: 链接脚本
- Makefile: 构建脚本