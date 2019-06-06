#!/usr/bin/bash 

dir=$(pwd)
map_name="crazy_monster.w3x"

main(){
	for a in $@; do
		case $a in
	    	run)
				${dir}/tools/w3x2lni/bin/w3x2lni-lua.exe ${dir}/tools/运行.lua ${dir}
	    		;;
	    	config)
				${dir}/tools/w3x2lni/bin/w3x2lni-lua.exe ${dir}/tools/配置.lua ${dir}
	    		;;
	    	check)
				${dir}/tools/w3x2lni/bin/w3x2lni-lua.exe ${dir}/tools/语法检查.lua ${dir}
	    		;;
	    	obj)
				rm ${dir}/${map_name} -rf
				${dir}/tools/w3x2lni/w2l.exe obj ${dir} ${dir}/${map_name}
	    		;;
	    	slk)
				rm ${dir}/${map_name} -rf
				${dir}/tools/w3x2lni/w2l.exe slk ${dir} ${dir}/${map_name}
	    		;;
	    	lni)
				${dir}/tools/w3x2lni/w2l.exe lni ${dir}/${map_name} ${dir} 
	    		;;
		esac
	done
}

main "$@"
