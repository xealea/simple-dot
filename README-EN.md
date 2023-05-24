## Showcase
Here are some screenshots showcasing the dotfiles in action:

| Showcase 1 | Showcase 2 | Showcase 3 |
|--|--|--|
|![img](https://iili.io/HgKeUmX.md.png)|![img](https://iili.io/HgKQ3oQ.md.png)|![img](https://iili.io/HgKL1nV.md.png)

### Dotfiles Installation Guide
This guide will walk you through the installation process for the dotfiles provided in the repository [xealea/simple-dot](https://github.com/xealea/simple-dot).

### Prerequisites
Before proceeding with the installation, ensure that you have the following requirements:
- Bash (Bourne Again SHell)
- Git
- Curl or Wget (for downloading the installation script)

### Installation Steps
1. Open your terminal.

2. Download the `dotfiles_install.sh` script from the repository using either `wget` or `curl`. Choose one of the following methods:
   - Using `wget`:
     ```bash
     wget https://github.com/xealea/simple-dot/raw/master/dotfiles_install.sh
     ```
   - Using `curl`:
     ```bash
     curl -O https://github.com/xealea/simple-dot/raw/master/dotfiles_install.sh
     ```

3. Make the downloaded script executable:

   ```bash
   chmod +x dotfiles_install.sh
   ```

4. Run the script to start the installation process:

   ```bash
   ./dotfiles_install.sh
   ```

5. Follow the prompts during the installation process to select the folders you want to copy. You can choose to copy all folders (excluding the .git folder).

6. Once the installation completes, the dotfiles will be copied to your home directory. Enjoy your new dotfiles setup!

### Wallpaper Customization
You can customize the wallpaper by using a keybind **`Mod (Window) + Shift + B`**. This will bring up the Rofi interface, where you can choose options to change the **wallpaper permanently using `feh`**, or use `hsetroot`, `swww`, or `swaybg` if you don't want to change the wallpaper permanently.

### Adding Wallpaper 
To add wallpaper, place the PNG or JPG file in the `$HOME/.wall` folder. Ensure that the wallpaper images are in either PNG or JPG format and located within the `$HOME/.wall` folder, if you done, now just open it with keybind **`Mod (Window) + Shift+ B`** and you will see the name of the wallpaper that you added earlier

### Support
If you encounter any issues or have questions regarding the installation process, please feel free to open an issue on the repository or reach out to the author, Lea, via email at xealea@proton.me.

### Note
This dotfiles configuration is still under development and may not include all the features you require or have bug.
