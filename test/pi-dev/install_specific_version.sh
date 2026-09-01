#!/bin/bash
set -e

# Импортируем функции логирования и проверки
source dev-container-features-test-lib

# Проверяем, доступна ли установленная утилита через запрос версии
check "Check version" pi --version
check "pi version is 0.82.1" sh -c 'pi --version | grep -q "0.82.1"'

# Выводим финальный статус тестов
reportResults