#!/bin/bash


# Устанавливаем обновления и утилиты
installing_utils() {
    pacman -Syu
    pacman -S --noconfirm base-devel neovim sipcalc go rust nano
    if [ $? -eq 0 ] ; then
        printf '\033[32m[OK]\033[0m Успешно установлено обновление и утилиты!\n'
    else
        printf '\033[91m[ERR]\033[0m Ошибка при обновлении и установке утилит!\n'
    fi
}


# Создаем юнит для systemd
create_iptables_service() {
    /root/arch_server/create_iptables_service.sh
    if [ $? -eq 0 ] ; then
        printf '\033[32m[OK]\033[0m Успешно создан systemd unit!\n'
        printf '\033[32m[OK]\033[0m Сейчас правила iptables выглядят так:\n'
        iptables -nvL --line-numbers
    else
        printf '\033[91m[ERR]\033[0m Ошибка при запуске сервиса!\n'
        printf '\033[91m[ERR]\033[0m Посмотрите файл юнита: /etc/systemd/system/iptables_script.service\n'	
    fi
}


# Меняем конфиг sshd
change_sshd_conf() {
    rm /etc/ssh/sshd_config
    cp /root/arch_server/sshd_config /etc/ssh/
    chmod 600 /etc/ssh/sshd_config
    systemctl restart sshd
    systemctl status sshd
}

# Добавляем пользователя
add_user() {
    useradd -m 0xm00nc0d3   
    printf '\033[93m[WARN]\033[0m Сейчас вам будет предложено ввести пароль для пользователя! \n'
    passwd 0xm00nc0d3
}


# Конфигурируем сервер
configure_server() {
    installing_utils
    change_sshd_conf
    create_iptables_service
    add_user
    exit 0
}

configure_server
