#/bin/bash
log_dir=/data/log
today_name=`date +%Y_%m_%d`

#打包当天的日志
for my_file in `find $log_dir -name '*.log' -type f`
do
    dir_name=`echo $my_file|sed 's/\.log/_log_back/'`
    #otherlog=`echo $my_file|awk -F/ '{print $NF}'`
    #find $log_dir -name $otherlog'.*'|xargs -i mv {} $dir_name
    [ -d $dir_name ] || {
        mkdir $dir_name
    }
    gzip -c $my_file > ${dir_name}/${today_name}.gz
    echo '' > $my_file
done
#清除60天前的日志文件
find $log_dir -type f -name '*.gz' -ctime +60 |xargs rm -f
