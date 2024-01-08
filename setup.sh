#!/bin/bash

# Function to display messages
display_message() {
  echo "----------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------"
}

# Check if Homebrew is installed, and install it if not
if ! command -v brew &> /dev/null; then
  display_message "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  display_message "Homebrew is already installed."
fi

# Install or update iTerm2
display_message "Installing/updating iTerm2..."
brew install --cask iterm2

# Install or update Zsh
display_message "Installing/updating Zsh..."
brew install zsh

# Set Zsh as the default shell
display_message "Setting Zsh as the default shell..."
sudo chsh -s /usr/local/bin/zsh

# Install or update Oh My Zsh
display_message "Installing/updating Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install or update Powerlevel10k theme for Oh My Zsh
display_message "Installing/updating Powerlevel10k theme..."
git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k pull || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Zsh theme to Powerlevel10k
display_message "Setting Zsh theme to Powerlevel10k..."
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install Zsh plugins
display_message "Installing Zsh plugins..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Add lines to enable Zsh plugins in ~/.zshrc
echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

# Install other software via Homebrew
display_message "Installing other software via Homebrew..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask google-chrome
brew install --cask notion
brew install --cask docker
brew install xz
brew install pyenv
brew install nvm
brew install git
brew install git-lfs

# Install Python versions via pyenv
display_message "Installing Python versions via pyenv..."
pyenv install 3.9.13
pyenv install 3.11.0

# Print installation status
display_message "Installation completed."
