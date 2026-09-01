#!/bin/bash
set -e

# Импортируем функции логирования и проверки
source dev-container-features-test-lib

# Проверяем, доступна ли установленная утилита через запрос версии
check "Check version" opencode --version
check "opencode version is 1.18.1" sh -c 'opencode --version | grep -q "1.18.1"'

# Выводим финальный статус тестов
reportResults