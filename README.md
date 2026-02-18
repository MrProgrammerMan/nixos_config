# NixOS Configuration

A modular NixOS configuration using flakes, home-manager, and flake-parts for managing multiple machines.

## Structure

This configuration uses a modular structure with automatic flake output generation via `import-tree`:

```
modules/
├── flake-parts.nix    # System definitions
├── hosts/             # Host configurations (*.nix files)
├── users/             # User configurations (*.nix files)
├── nixosModules/      # System-level modules
└── homeModules/       # Home-manager modules
```

### Configuration Pattern

Both host and user files follow a dual-definition pattern:

**Host files** define:
- `nixosConfigurations.<hostname>` - System configuration entry point
- `nixosModules.<hostname>` - Host-specific module (hardware, network settings)

**User files** define:
- `homeConfigurations.<username>` - Standalone home-manager configuration
- `nixosModules.<username>` - NixOS user account settings
- `homeModules.<username>` - User's home-manager configuration

This mirroring allows users to be either standalone home-manager configurations or integrated into NixOS systems.

## Usage

Apply configuration:
```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

Update dependencies:
```bash
nix flake update
```
