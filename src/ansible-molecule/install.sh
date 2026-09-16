#!/bin/sh
set -eu

ensure_pip() {
    if ! command -v python3 >/dev/null 2>&1; then
        echo "ERROR: python3 not found. Ensure the 'python' feature is installed."
        exit 1
    fi
    if ! python3 -m pip --version >/dev/null 2>&1; then
        echo "ERROR: python3 -m pip not found. Ensure the 'python' feature is installed with toolsToInstall: \"pip\"."
        exit 1
    fi
}

install_ansible() {
    echo "Installing ansible for user: $_REMOTE_USER"

    # 2. Вызываем pip от имени целевого пользователя.
    # Флаг -H (или --set-home) критически важен, чтобы pip понимал,
    # что домашняя директория изменилась на /home/_REMOTE_USER
    if [ "$ANSIBLE_VERSION" = "latest" ]; then
        sudo -H -u "$_REMOTE_USER" python3 -m pip install ansible --user --break-system-packages
    else
        sudo -H -u "$_REMOTE_USER" python3 -m pip install "ansible==${ANSIBLE_VERSION}" --user --break-system-packages
    fi

    # 3. Проверяем, доступна ли команда ansible для этого пользователя.
    # Запускаем проверку от его имени, так как в его сессии ~/.local/bin уже должен быть в PATH.
    if sudo -i -u "$_REMOTE_USER" command -v ansible >/dev/null; then
        echo "ansible installed successfully!"
        sudo -i -u "$_REMOTE_USER" ansible --version
        return 0
    else
        echo "ERROR: ansible installation failed!"
        return 1
    fi
}

install_molecule() {
    echo "Installing ansible-lint and molecule for user: $_REMOTE_USER"

    sudo -H -u "$_REMOTE_USER" python3 -m pip install ansible-lint --user --break-system-packages

    if [ "$MOLECULE_VERSION" = "latest" ]; then
        sudo -H -u "$_REMOTE_USER" python3 -m pip install molecule --user --break-system-packages
        sudo -H -u "$_REMOTE_USER" python3 -m pip install proxmoxer requests --break-system-packages
    else
        sudo -H -u "$_REMOTE_USER" python3 -m pip install "molecule==${MOLECULE_VERSION}" --user --break-system-packages
        sudo -H -u "$_REMOTE_USER" python3 -m pip install proxmoxer requests --break-system-packages
    fi


    if sudo -i -u "$_REMOTE_USER" command -v molecule >/dev/null; then
        echo "molecule installed successfully!"
        sudo -i -u "$_REMOTE_USER" molecule --version
        return 0
    else
        echo "ERROR: molecule installation failed!"
        return 1
    fi
}

# Main script starts here
main() {
    echo "Activating feature 'ansible-molecule'"

    ensure_pip

    # Install ansible
    install_ansible || exit 1
    # Install molecule
    install_molecule || exit 1
}

# Execute main function
main
