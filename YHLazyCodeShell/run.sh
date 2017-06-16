#!/bin/bash
iosBatchLazyCode(){
	
	if test $1 = "UIButton" ; then
   		str="[$1 buttonWithType:UIButtonTypeCustom];"
   	else
   		str="[[$1 alloc]init];"
	fi
  echo -e "
- ($1 *)$2{
    if (_$2 == nil) {
        _$2 = $str
    }
    return _$2;
}" 
}

#追加一行空格
echo -e '\n' >> propertys.txt

#读取文件存数组
i=0
while read line
do
	lineStr=$line
	noneSpaceStr=${lineStr// /}
    ARR[$i]=$noneSpaceStr
    let i+=1
done < propertys.txt

#格式化输出到out.txt
for str in ${ARR[*]}
do
	a=${str#*)}
	b=${a%"*"*}

	c=${str#*"*"}
	d=${c%*;}
	iosBatchLazyCode $b $d 
done >> out.txt 

