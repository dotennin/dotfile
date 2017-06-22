#! /bin/bash
date
strings /etc/localtime

# 一応、バックアップを取ります
cp /etc/sysconfig/clock /etc/sysconfig/clock.org

# viなどで編集してもよし
echo -e 'ZONE="Asia/Tokyo"\nUTC=false' > /etc/sysconfig/clock

# 一応、バックアップを取ります
cp /etc/localtime /etc/localtime.org

# timezoneファイル差し替え
ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 変更後、表示
date
strings /etc/localtime
