{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
	options.hyprland = {
		binding = {
			mainMod = lib.mkOption {
				default = "Super";
			};
		};
	};
	
	config = lib.mkIf nixosConfig.compositor.hyprland.enable {
		home.packages = [
			pkgs.wl-clipboard
			pkgs.waybar
		];

		wayland.windowManager.hyprland = {
			enable = true;
			#package = inputs.hyprland.packages."${pkgs.system}".hyprland;
			
			settings = {
				general = {
					gaps_in = 5;
					gaps_out = 10;
					resize_corner = 3;
				};

				decoration = {
					rounding = 8;
				};

				
				#INPUT
				input = {
					kb_layout = nixosConfig.locale.keyboardLayout;
					kb_variant = nixosConfig.locale.keyboardVariant;
					follow_mouse = "1";
				};

				#BINDING
				bindm = [
					"${config.hyprland.binding.mainMod}, mouse:272, movewindow"
					"${config.hyprland.binding.mainMod}, mouse:273, resizewindow"
				];
				
				bind = [
					", F12, togglespecialworkspace"
					"ALT, F4, killactive"
					"ALT SHIFT, F4, exit"
					"${config.hyprland.binding.mainMod}, V, togglefloating"
				] ++
					lib.optional config.applications.terminal.enable "${config.hyprland.binding.mainMod}, Q, exec, ${config.applications.terminal.binary}" ++
					lib.optional config.applications.launcher.enable "${config.hyprland.binding.mainMod}, SPACE, exec, ${config.applications.launcher.binary}" ++
					lib.optional config.applications.explorer.enable "${config.hyprland.binding.mainMod}, E, exec, ${config.applications.explorer.binary}" ++
					lib.optional config.applications.screenshot.enable "${config.hyprland.binding.mainMod}, PRINT, exec, ${config.applications.screenshot.binary}" ++
					builtins.concatLists (builtins.genList (
							x: let
								ws = let
									c = (x + 1) / 10;
								in
									builtins.toString (x + 1 - (c * 10));
							in [
								"${config.hyprland.binding.mainMod}, code:1${ws}, workspace, ${toString (x + 1)}"
								"${config.hyprland.binding.mainMod} SHIFT, code:1${ws}, movetoworkspace, ${toString (x + 1)}"
							]
						)
						10);

				exec-once = [
					"[workspace special; size 100% 100%;move 12.5% 40] ${config.applications.terminal.binary} ${config.applications.zellij.binary}"
				] ++ 
					lib.optional config.applications.wallpaper.enable "${config.applications.wallpaper.binary}";

				monitor = [ "Unknown-1,disable" ] ++ map (m: let
					resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
					position = "${toString m.x}x${toString m.y}";
					in
					"${m.name},${if m.enabled then "${resolution},${position},1" else "disable"}"
				) (nixosConfig.monitors);
				
				workspace = map (m:
					"${m.name},${m.workspace}"
				) (lib.filter (m: m.enabled && m.workspace != null) nixosConfig.monitors);

			};
		};
		
		home.sessionVariables = {
			#Fix cursor issue
			WLR_NO_HARDWARE_CURSORS = "1";
			#Hint Electron to use wayland
			NIXOS_OZONE_WL = "1";
		};
	};
}