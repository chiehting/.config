function fish_greeting -d "Greeting message on shell session start up"
     echo -en "\n"
     echo -en (welcome_message) "\n"
     echo -en "\n"
     echo -en (show_date_info) "\n"
     echo -en "\n"
     echo -en "Space vessel computer:\n"
     echo -en (show_net_info) "\n"

#     echo -en "          ________          ""\n"
#     echo -en "    o    |   __   |         " (welcome_message) "\n"
#     echo -en "    \_ O |  |__|  |         ""\n"
#     echo -en " ____/ \ |___WW___|         " (show_date_info) "\n"
#     echo -en " __/   /     ||             ""\n"
#     echo -en "             ||             ""Space vessel computer:\n"
#     echo -en "             ||             " (show_net_info) "\n"
#     echo -en "_____________||___________  ""\n"
#     echo ""

#    echo -en "        |         " (welcome_message) "\n"
#    echo -en "       / \        \n"
#    echo -en "      / _ \       " (show_date_info) "\n"
#    echo -en "     |.o '.|      \n"
#    echo -en "     |'._.'|      Space vessel computer:\n"
#    echo -en "     |     |      " (show_net_info) "\n"
#    echo -en "   ,'|  |  |`.    \n"
#    echo -en "  /  |  |  |  \   \n"
#    echo -en "  |,-'--|--'-.|   \n"

#    echo ""
    set_color grey
#    echo "Have a nice trip"
    set_color normal
end

function welcome_message -d "Say welcome to user"
    echo -en "Welcome aboard captain "
    set_color F0F  # white
    echo -en (whoami) "!"
    set_color normal
end

function show_date_info -d "Prints information about date"

    set --local up_time (uptime | cut -d "," -f1 | cut -d "p" -f2 | sed 's/^ *//g')

    set --local time (echo $up_time | cut -d " " -f2)
    set --local formatted_uptime $time

    switch $time
    case "days" "day"
        set formatted_uptime "$up_time"
    case "min"
        set formatted_uptime $up_time"utes"
    case '*'
        set formatted_uptime "$formatted_uptime hours"
    end

    echo -en "Today is "
    set_color cyan
    echo -en (date +%Y.%m.%d)
    set_color normal
    echo -en ", we are up and running for "
    set_color cyan
    echo -en "$formatted_uptime"
    set_color normal
    echo -en "."
end

function show_net_info -d "Prints information about network"

    set --local os_type (uname -s)
    set --local ip ""
    set --local gw ""

    if [ "$os_type" = "Linux" ]
        set ip (ip address show | grep -E "inet .* brd .* dynamic" | cut -d " " -f6)
        set gw (ip route | grep default | cut -d " " -f3)

    else if [ "$os_type" = "Darwin" ]
        set ip (ifconfig | grep -v "127.0.0.1" | grep "inet " | head -1 | cut -d " " -f2)
        set gw (netstat -nr | grep -E "default.*UGSc" | cut -d " " -f13)
    end

    set_color yellow
    echo -en "\tNet: "
    set_color 0F0  # green
    echo -en "Ip address $ip, default gateway $gw"
    set_color normal
end
