#!/bin/bash

# Source global definitions
# --> Прочитать настройки из /etc/bashrc
. ~/.bashrc

# --> Прочитать настройки:
. ~/bin/utility/.debug_version_vdsetup.sh &>/dev/null ;
. ~/bin/utility/.varfunc.sh &>/dev/null ;
. ~/bin/utility/.css.sh &>/dev/null ;


echo ;
script_name ;

 #------------------------------------
  # install-reinstall-remove_vdsetup
  #------------------------------------
 
  function reinstall_update_remove_vdsetup()
     {
         function menu()
         {
            # gh auth login 
            Version_vdsetup &>/dev/null ;
            echo -e "\n $(black_U23A7    )" ;
            echo -en " $(white_1       ) $(green_tick) Now you use GitHub Token" ; echo -e " : ${BLACK}$(gh auth token)" ;
            echo -e " $(white_1        ) " ; 
            echo -e " $(white_1        )    Что вы хотите сделать с vdsetup?" 
            echo -e " $(white_1        ) " ; 
            echo -e " $(green_1        ) $(green_n1)) Синхронизировать (${BLACK}до свежей beta${NC}) vsync. ${BLACK}(press Enter).${NC} " ;
            echo -e " $(green_1        ) $(green_n2)) ${GREEN}Включить${NC}/${BLACK}отключить${NC} автоматическую синхронизацию. (${BLACK}todo..${NC}) " ; 
            echo -e " $(red_1          ) $(red_n3  )) Удалить и переустановить (${BLACK}до свежей beta${NC}). " ; 
            echo -e " $(red_1          ) $(red_n4  )) Удалить полностью. (${BLACK}todo..${NC})" 
            echo -e " $(white_1        ) " ; 
            echo -e " $(white_1        ) $(red_n5  )) ${GREEN}Включить${NC}/${BLACK}отключить${NC} Debugger" ; 
            echo -e " $(white_1        ) $(green_n0)) Выход." ; 
            echo -e " $(black_U23A9    )\n" ;
         
         echo -e "${BLACK}		Введите цифру меню от 0 до 4\n ${NC}"
         echo -en "		Ваш выбор? ${BLACK}"
         
            read a
                    case $a in
                        1) sync_1 ; sleep 1 ; exit 0 ;;
                        2) auto_sync_2 ; sleep 1 ; menu ;;
                        3) del_reinstall_3 ; sleep 1 ; css ; menu ;;
                        4) remove_vdsetup_4 ; sleep 1 ; menu ;;
                        5) debug_en_dis ; menu ;;
                        "") sync_1 ;;
                    0) exit 0 ;;
                    *) echo -e ${RED}"\n   		Wrong option."${NC}; menu ;;
                    esac
            
            
            
         }
 
 
         function debug_en_dis()
         {
             
             debug_stat=$(cat /root/.debug.txt 2>/dev/null) ;
               
              # if [[ $debug_stat == '1' ]] 
               #then msg_debug_stat=$(echo -e "${RED}Debugger enabled${NC}") 
              # else msg_debug_stat=$(echo -e "${RED}Debugger disabled${NC}") 
              # fi ;
               
               if [[ "$debug_stat" == '1' ]] 
               then 
               
                    echo -e "\n $(black_U23A7) $(green_star) Debugger ${GREEN}enabled${NC} and ...." ; 
                    echo -e " $(black_U23A9) $(green_tick) ...will be ${BLACK}disable${NC} now!\n" ; sleep 1; vdsetup -d0 ;
               
               
               else 
                    echo -e "\n $(black_U23A7) $(green_star) Debugger ${BLACK}disabled${NC} and ..." ;
                    echo -e " $(black_U23A9) $(green_tick) ... will be ${GREEN}enable${NC} now!\n" ; sleep 1 ; vdsetup -d1 ;
               fi
               
             
             
             
         }
        
         function sync_1()
         {
            # sync
            echo -e "\n $(black_U23A7) $(green_star) Вы выбрали:" ;
            echo -e " $(black_U23A9) $(green_tick) $(green_n1)) Синхронизировать vdsetup до последней доступной beta.\n" ;
            ~/bin/utility/gh-ss.sh ;
            #(rsync -avp --exclude '.git' --exclude '.DS_Store' /root/.GitHub_Repo/VDSetup/ /root) &>/root/rsync_GitHub_Repo-VDSetup.log ;
            script_name ;
         }
         
         function auto_sync_2()
         {
            # auto sync
            echo -e "\n $(black_U23A7) $(green_star) Вы выбрали:" ; 
            echo -e " $(black_U23A9) $(green_tick) $(green_n2)) Включить/отключить автоматическую синхронизацию. ${BLACK}(todo)\n" ;
         }
         
         function del_reinstall_3()
         {
             function del_reinstall()
            {
               echo -e "\n $(black_U23A7) $(green_star) Вы выбрали:" ;
               echo -e " $(black_U23A9) $(green_tick) $(red_n3  )) Удалить и переустановить vdsetup на последнюю доступную beta.\n" ; 
               
               cd ~ ; (rm -rf /root/.VDSInstaller /root/.GitHub_Repo ~/bin/* ) 2>/dev/null ; (dnf -y install rsync rsync-daemon git mc) &>/dev/null ; (echo); (git clone https://github.com/giteed/VDSInstaller.git /root/.VDSInstaller) ; (/root/.VDSInstaller/bin/utility/preloader.sh reinstall) ; 
               
            }
           
            del_reinstall ;
            
         }
         
         function remove_vdsetup_4()
         {
            # remove vdsetup
            echo -e "\n $(black_U23A7) $(green_star) Вы выбрали:" ; 
            echo -e " $(black_U23A9) $(green_tick) $(red_n4  )) Удалить полностью${RED}!\n" ;
            echo -e "  $(green_star) Давай, давай... удаляй меня полностью...\n    Полностью удаляй!\n" ; 
            sleep 3 ;
            
         }
         
         
         menu ;
        
     }
     
     css ;
     reinstall_update_remove_vdsetup ;
 
 
 
 
 exit 0 ;
