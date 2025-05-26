# 项目介绍
这是一个自制的操作系统名为“xuanhe”。

## 使用方法

### 真机启动
1. 使用NASM编译MBR: `nasm -f bin mbr.asm -o mbr.bin`
2. 将mbr.bin写入U盘或硬盘的第一个扇区:
   - Windows: 使用`dd for Windows`工具:
     ```
     dd if=mbr.bin of=\\?\Device\HarddiskX\Partition0 bs=512 count=1
     ```
     其中HarddiskX是目标磁盘号，可通过`diskpart`命令查看
   - Linux/macOS: 使用dd命令:
     ```
     sudo dd if=mbr.bin of=/dev/sdX bs=512 count=1
     ```
3. 设置BIOS从该设备启动

### Windows模拟器
1. 安装QEMU:
   - 手动下载安装包
2. 编译并运行:
   ```
   nasm -f bin mbr.asm -o mbr.bin
   qemu-system-x86_64 -drive format=raw,file=mbr.bin
   ```

### macOS模拟器
1. 安装QEMU: `brew install qemu`
2. 编译并运行:
   ```
   nasm -f bin mbr.asm -o mbr.bin
   qemu-system-x86_64 -drive format=raw,file=mbr.bin
   ```

### Linux模拟器
1. 安装QEMU: `sudo apt install qemu-system-x86`
2. 编译并运行:
   ```
   nasm -f bin mbr.asm -o mbr.bin
   qemu-system-x86_64 -drive format=raw,file=mbr.bin
   ```