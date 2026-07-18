# Pop Shell Custom Environment

This repository stores all modifications, keyboard shortcuts, and configurations needed to transform the default Pop Shell extension into the **Custom Whitelist Mode**.

In this mode, all system windows float normally by default. Only applications explicitly added to the "Tiling Windows List" (accessible via the top panel UI) will be automatically tiled by Pop Shell. Additionally, the design features thinner active-hint borders and removes the visual background overlay on the Pop Launcher bar.

## How to Restore the Environment on a Fresh Install

Follow the three steps below to perfectly configure the exact extension with your shortcuts and modifications on a fresh install (or after upstream updates).

### Step 1: Apply the Patch and Install Pop Shell
The `.patch` file contains all source code modifications (UI tweaks, inverted logic, CSS border thickness, and Launcher visual overlay suppression).

1. Clone the original upstream repository locally:
   ```bash
   git clone https://github.com/pop-os/shell.git ~/utils/shell
   ```
2. Copy the patch file from this repository to the cloned repository:
   ```bash
   cp shell/pop-shell-customizations.patch ~/utils/shell/
   ```
3. Apply the modifications:
   ```bash
   cd ~/utils/shell
   git apply pop-shell-customizations.patch
   ```
4. Compile and install the extension on your system:
   ```bash
   # For Fedora OSTree systems (like Bluefin, Bazzite, or Silverblue), using distrobox is recommended
   distrobox enter fedora -- bash -c 'cd ~/utils/shell && make compile install'
   # For standard systems (Ubuntu/Debian/Arch) simply run: make local-install
   ```
   *After installing, remember to reload your session or enable the extension in GNOME Extensions.*

### Step 2: Restore Keyboard Shortcuts
The `.patch` file does not handle keyboard shortcuts, as they are isolated user configurations saved in the GNOME `dconf` database. To reload them from the backup:

1. Navigate to the directory where your shortcuts are saved:
   ```bash
   cd shortcuts-backup
   ```
2. Use the `dconf load` command to flawlessly apply your custom binds:
   ```bash
   dconf load /org/gnome/shell/extensions/pop-shell/ < your-shortcuts.txt
   ```
   *(Replace `your-shortcuts.txt` with the name of your backup file if necessary)*

### Step 3 (Optional): Restore Your Apps Whitelist (config.json)
Pop Shell saves your chosen tiling applications in a JSON file inside your user directory.
If you have backed it up, simply move it back to its correct location to instantly apply your tiling rules:

```bash
cp config.json ~/.config/pop-shell/config.json
```

---
**Note:** The original [Pop Launcher](https://github.com/pop-os/launcher) extension can be installed normally according to its upstream documentation; all graphical suppressions for it are contained and automatically injected by our Pop Shell patch.
