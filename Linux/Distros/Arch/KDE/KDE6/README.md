# How to Change KDE Themes 

1. Reference [KDE Store Plasma Themes](https://store.kde.org)

2. Find a Theme [Tokyo Night Plasma 6](https://store.kde.org/p/2141942)

3. Clone the Source Code [Plasma Tokyo Night](https://github.com/Jayy-Dev/Plasma-Tokyo-Night)

```sh
gh repo clone Jayy-Dev/Plasma-Tokyo-Night
```

4. Copy the Theme Components

 * Aurorae Window Decoration: Contains the window decoration for the Aurorae engine.

```sh
mkdir -p ~/.local/share/aurorae/themes
cp -r aurorae/TokyoNight ~/.local/share/aurorae/themes/
```

* Color Scheme

```sh
mkdir -p ~/.local/share/color-schemes
cp colorscheme/TokyoNight.colors ~/.local/share/color-schemes/
```
    - You can then set it through System Settings → Colors.

* Look and Feel Package

```sh
mkdir -p ~/.local/share/plasma/look-and-feel
cp -r "lookandfeel/Tokyo Night" ~/.local/share/plasma/look-and-feel/
```
    - Apply it in System Settings → Appearance → Global Theme.

* Desktop Theme

```sh
mkdir -p ~/.local/share/plasma/desktoptheme
cp -r "Tokyo Night Desktop" ~/.local/share/plasma/desktoptheme/
```
    - Set it through System Settings → Appearance → Plasma Style.

* Wallpapers

```sh
mkdir -p ~/Pictures/Wallpapers
cp wallpapers/Tokyo-Night.jpg ~/Pictures/Wallpapers/
```

* Applying the Theme

    **After** installing each of these components:

    1. Open System Settings.
    2. Navigate to Appearance.
    3. Set the Global Theme to "Tokyo Night" if available.
    4. Manually select the color scheme, window decorations, Plasma style, and wallpaper, as outlined above.

* Troubleshooting

    * Missing Components: If some options don’t appear, make sure you've placed the files in the correct directories (~/.local/share/...). 
        - If Plasma is running, you might need to log out and back in or restart KDE Plasma (kquitapp5 plasmashell && kstart5 plasmashell).
        
* Permissions: Ensure that the files have the correct permissions and are accessible by your user. They should be owned by your user, not root.
    
