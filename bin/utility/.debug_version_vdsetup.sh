#!/bin/bash

# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc

# --> Прочитать настройки:
. ~/bin/utility/.varfunc.sh &>/dev/null ;
. ~/bin/utility/.css.sh &>/dev/null ;

echo ;
script_name ;

   #------------------------------------
	  # Информация о версии скрипта VDSetup
	  #------------------------------------ 
	  
	function ver() 
	{ 
	   source ~/.bashrc ; #css ; 
	   echo -e "\n $(Version_vdsetup)" ;
	}

   
   #------------------------------------
	  # Cтатус "Debug"
	  #------------------------------------ 
	  
	function ds() 
	{ 
	   #css ;
	   source ~/.bashrc ; #css ; 
	   echo -e "\n ${msg_debug_stat}" ;
	}


function test100()
{
   echo -e "$$$$" 
}



   #------------------------------------
	  # Version_vdsetup
	  #------------------------------------ 
	  
	function Version_vdsetup()
	  {
		 echo -e "Ver: GH-1.0.0.55"  #| bat -l nix ) #|| $( echo -e "${RED}Ver${NC}: GH-1.0.0${NC}" ) 
	  }

   debug_stat=$(cat /root/.debug.txt) ;
   
   if [[ $debug_stat == '1' ]] 
	  then msg_debug_stat=$(echo -e "${GREEN}Debug enabled${NC}") ;
	  else msg_debug_stat=$(echo -e "${RED}Debug disabled${NC}") ;
   fi ;
   
   function dsm_en()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debug enabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d0 to disabled Debug.\n" ;
	  source ~/.bashrc ;
   }
   
   function dsm_dis()
   {
	  echo -e "\n $(black_U23A7) $(green_star) Debug disabled" ;
	  echo -e " $(black_U23A9) $(green_tick) run: vdsetup -d1 to enabled Debug.\n" ; 
	  source ~/.bashrc ;
   }
   
   function dsm()
   {
	  if [[ $debug_stat == '1' ]] 
	  then source ~/.bashrc ; dsm_en ;
	  else source ~/.bashrc ; dsm_dis ;
	  fi ;
   }
   
   
   #------------------------------------
	  # script_name debug
	  #------------------------------------   
	  
	function debug()
	  {
		 
		 function debug_1_on()
		 {
			path_n=$0
			# echo -e "debug status is $debug_stat" ;
			
			echo -e "        $(black_U23A7    ) " ;
			echo -e "       $(red_star)$(red_1          ) ${NC}!${NC}${BLACK}#${RED} ---------------${BLACK}Debug${RED}--------------- ${BLACK}#${NC}!" ;
			echo -en "       $(red_star)$(ellow_1       )  ${BLACK}Path ......${NC}: " ; echo -e "${NC}$(pwd)" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Script Name${NC}:${GREEN} "$0" ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        )  ${BLACK}Date ......${NC}: "$(date)" ${NC}" ;
			echo -e "       $(red_star)$(ellow_1        ) " ; ( ( ( ps aux | grep $path_n ) | bat -l nix -p ) 2>/dev/null || ps aux | grep $path_n ) ;
			echo -e "       $(red_star)$(ellow_1        ) " ;
			echo -e "        $(black_U23A9    ) \n" ;
		 }
		 
		 function debug_0_off()
		 {
		  +x #echo -e "debug status is $debug_stat" ;
		 }
		 
		 function debug_check_status()
		 {
			
			
		 if [[ $debug_stat == "1" ]]
			then debug_1_on ;
			else debug_0_off
		 fi ;
		 }
		 
		 debug_check_status ;
		 
	  }
   
   #------------------------------------
	  # script_name
	  #------------------------------------  
	  
	function script_name() 
	{ 
	  (debug ;) 2>/dev/null ; 
   }

exit 0 ; 