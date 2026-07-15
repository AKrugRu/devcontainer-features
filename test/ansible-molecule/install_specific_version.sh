#!/bin/bash
set -e

# Импортируем функции логирования и проверки
source dev-container-features-test-lib

# Проверяем, доступна ли установленная утилита через запрос версии
check "Check version ansible" ansible --version
check "Check version molecule" molecule --version

# Выводим финальный статус тестов
reportResults