# NixOS Configuration

A modular, declarative NixOS configuration for multiple machines using flakes and home-manager. This repository manages system and user configurations for a desktop workstation and a laptop through composable modules.

## 🌟 Features

- **Modular Architecture**: Composable modules for system and user configurations
- **Flake-based**: Modern Nix flakes with flake-parts for organization
- **Multi-machine**: Supports both desktop and laptop configurations
- **Home Manager Integration**: User-level configuration management
- **Auto-discovery**: Uses import-tree for automatic module discovery

## 📁 Repository Structure

```
.
├── flake.nix              # Entry point with inputs and outputs
├── flake.lock             # Locked dependency versions
└── modules/
    ├── flake-parts.nix    # System architecture definitions
    ├── hosts/             # Machine-specific configurations
    │   ├── desktop/       # Desktop machine config
    │   └── laptop/        # Laptop machine config
    ├── users/             # User account definitions
    │   ├── carro/         # Caroline's user config
    │   └── cepheus/       # Jonas's user config
    ├── nixosModules/      # System-level modules
    │   ├── audio.nix
    │   ├── boot.nix
    │   ├── display.nix
    │   ├── gaming.nix
    │   ├── graphics.nix
    │   ├── hyprland.nix
    │   └── ...
    └── homeModules/       # User home-level modules
        ├── git.nix
        └── vscode.nix
```

## 🖥️ Configured Hosts

### Desktop
- **CPU**: Intel with KVM support
- **GPU**: NVIDIA (proprietary drivers, modesetting enabled)
- **Purpose**: Primary workstation for gaming and development
- **Special Features**: Gaming setup (Steam, GameMode, Gamescope), NVIDIA graphics

### Laptop
- **CPU**: AMD with KVM support
- **GPU**: Intel integrated graphics
- **Purpose**: Mobile workstation
- **Special Features**: Power management (thermald, upower), touchpad support (libinput)

## 👥 User Configurations

### cepheus (Jonas)
Primary user with full development environment:
- **Groups**: wheel, networkmanager, kvm, vboxusers, input, abdusers
- **Development**: Git with GitHub shortcuts, VSCode
- **Applications**: Discord, GIMP, Inkscape, Reaper, Thunderbird, Bitwarden, Signal, Spotify

### carro (Caroline)
Secondary user with productivity focus:
- **Groups**: networkmanager
- **Applications**: Chromium, Microsoft Edge, OneNote, OneDrive, Signal, Discord, Obsidian

## 🔧 Available Modules

### NixOS Modules (System-level)

#### Starter Module (Base Configuration)
Composite module including:
- `audio` - Audio system configuration
- `boot` - Boot loader setup
- `display` - Display server configuration
- `graphics` - Graphics drivers
- `locale` - Localization settings
- `networking` - Network configuration
- `nix` - Nix package manager settings
- `printing` - Printer support
- `packages` - Base system packages

#### Feature Modules
- `gaming` - Steam, GameMode, Gamescope for gaming
- `hyprland` - Hyprland Wayland compositor with kitty terminal
- `shellAliases` - Custom shell command shortcuts
- `systemd` - System daemon configurations
- `homeManager` - Home-manager integration setup

### Home Manager Modules (User-level)

- `git.nix` - Git configuration with credential helper and GitHub shortcuts
- `vscode.nix` - VSCode editor setup

## 🚀 Usage

### Applying Configuration

To apply the configuration for a specific host:

```bash
# Rebuild system configuration
sudo nixos-rebuild switch --flake .#desktop  # For desktop
sudo nixos-rebuild switch --flake .#laptop   # For laptop
```

### Testing Changes

Test configuration without switching:

```bash
sudo nixos-rebuild test --flake .#desktop
```

### Updating Dependencies

Update flake inputs to latest versions:

```bash
nix flake update
```

### Adding New Hosts

1. Create a new directory under `modules/hosts/`
2. Add `default.nix` with host-specific configuration
3. Include hardware-configuration (auto-generated via `nixos-generate-config`)
4. Import desired modules from `nixosModules/`

### Adding New Modules

1. Create a new `.nix` file in `modules/nixosModules/` (system) or `modules/homeModules/` (user)
2. Define your module using standard NixOS module syntax
3. Import it in the desired host or user configuration

## 📦 Dependencies

- **nixpkgs**: NixOS unstable channel
- **home-manager**: User environment management
- **flake-parts**: Modular flake configuration
- **import-tree**: Automatic module discovery and imports

## 🎯 Design Philosophy

This configuration follows these principles:

1. **Modularity**: Each feature is a separate, composable module
2. **Declarative**: All system state is defined in code
3. **Reproducible**: Flake lock ensures consistent builds
4. **Maintainable**: Clear structure makes updates easy
5. **Flexible**: Easy to add/remove features per host or user

## 📝 Notes

- Hardware configurations are auto-generated by NixOS and should not be manually edited
- Machine-specific settings (graphics drivers, CPU features) are in host configurations
- Shared configurations are in the `starter` module
- User-specific home configurations use home-manager modules

## 🤝 Contributing

To customize this configuration for your own use:

1. Fork this repository
2. Update host configurations in `modules/hosts/`
3. Modify user accounts in `modules/users/`
4. Adjust modules to fit your needs
5. Update flake inputs if needed

## 📄 License

This is a personal NixOS configuration. Feel free to use and adapt for your own systems.
