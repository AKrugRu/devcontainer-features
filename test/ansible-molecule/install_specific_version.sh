#!/bin/bash
set -e

# Импортируем функции логирования и проверки
source dev-container-features-test-lib

# Проверяем, доступна ли установленная утилита через запрос версии
check "Check version ansible" ansible --version
check "Check version molecule" molecule --version
check "ansible version is 14.2.0" sh -c 'ansible --version | grep -q "14.2.0"'
check "molecule version is 26.6.0" sh -c 'molecule --version | grep -q "26.6.0"'

# Выводим финальный статус тестов
reportResults