#!/bin/ksh
PrintMenu() {
        echo 'Выберите обперацию:
        1. Напечатать имя текущего каталога
        2. Напечатать содержимое текущего каталога
        3. Создать каталог
        4. Предоставить всем право на запись в каталог
        5. Убрать всем право на запись в каталог
        6. Выйти из программы'
        echo 'Введите номер выбранной операции: '
}

MakeDirectory(){
        echo 'Введите имя директории'
        read name_dir
        mkdir -- "$name_dir" 2>>"$error_log" || echo "Error" 1>&2
}

GiveRight(){
        echo 'Введите имя каталога'
        read name_dir
        chmod -- ugo+w "$name_dir" 2>>"$error_log" || echo "Error" 1>&2
}

TakeRight(){
        echo 'Введите имя каталога'
        read name_dir
        chmod -- ugo-w "$name_dir" 2>>"$error_log" || echo "Error" 1>&2
}

error_log=$HOME/lab1_err
PrintMenu
while read num
do
        case $num in
                1) pwd 2>>"$error_log" || echo "Error" 1>&2 ;;
                2) ls 2>>"$error_log" || echo "Error" 1>&2 ;;
                3) MakeDirectory ;;
                4) GiveRight ;;
                5) TakeRight ;;
                6) exit 0 ;;
                *) echo "Неправильный ввод";;
	esac
        echo "$num"
        PrintMenu
done
