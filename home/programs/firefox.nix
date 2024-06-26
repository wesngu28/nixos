{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          auto-tab-discard
          bitwarden
          firefox-color
          return-youtube-dislikes
          search-by-image
          sponsorblock
          stylus
          web-scrobbler
          violentmonkey
        ];

        search = {
          default = "Brave Search";
          order = ["Brave Search" "StartPage" "DuckDuckGo"];
          force = true;

          engines = {
            "Brave Search" = {
              urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
              definedAliases = ["@b"];
            };

            "Nix Packages" = {
              urls = [{template = "https://search.nixos.org/packages?channel=unstable&type=packages&query={searchTerms}";}];
              definedAliases = ["@np"];
            };

            "NixOS Options" = {
              urls = [{template = "https://search.nixos.org/options?channel=unstable&type=packages&query={searchTerms}";}];
              definedAliases = ["@no"];
            };

            "Home Manager Options" = {
              urls = [{template = "https://home-manager-options.extranix.com/query={searchTerms}";}];
              definedAliases = ["nixh" "@nixh" "@homemanager"];
            };

            "Bing".metaData.hidden = true;
          };
        };
      };

      containerd = {
        id = 1;
        name = "containers";
        settings = {
          ui.prefersReducedMotion = "1";
          network.dns.disablePrefetch = true;
        };
      };

      treetabs = {
        id = 2;
        name = "treetabs";
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          firefox-color
          search-by-image
        ];
        userChrome = ''
          #TabsToolbar {
              visibility: collapse;
            }
        '';
      };
    };
  };
}
