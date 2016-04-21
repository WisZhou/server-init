#!/bin/bash
#备份mysql数据库
db_path="/data/mysql/"
back_root_path="/data/mysql_backup/"
today_str=`date +%Y_%m_%d`
back_path="${back_root_path}${today_str}/"
tar_file_name="${today_str}.bz2.tar"
   
if [ ! -d $db_path ]
then
        #数据库文件夹不存在时退出
        echo "DB path doesnot exists";exit;
fi

#创建备份目录
mkdir -p $back_path

#拷贝数据到备份目录
cp -r ${db_path} ${back_path} && {
    #打包并删除100日前数据数据
    cd $back_root_path
    tar -cjf ${tar_file_name} $today_str
    scp ${tar_file_name} root@172.26.117.103:/data/mysql_backup/`date +%d_%H`.tar.gz
    scp ${tar_file_name} root@172.26.117.105:/data/mysql_backup/`date +%d_%H`.tar.gz
    rm -r ${today_str}
    find . -type f -ctime +100 |xargs rm -f 
}
