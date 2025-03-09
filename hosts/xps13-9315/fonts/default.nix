{ config, lib, pkgs, ... }:

let 
  settings = import ./settings.nix;
in
{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerdfonts
      twemoji-color-font
      fira-code
      fira-code-symbols
  ];

  fontconfig = {
    localConf = ''
      <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
        <fontconfig>
          <!-- Default system-ui fonts -->
          <match target="pattern">
            <test name="family">
              <string>system-ui</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>sans-serif</string>
            </edit>
          </match>

          <!-- Default sans-serif fonts-->
          <match target="pattern">
            <test name="family">
              <string>sans-serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Caskaydia Cove NF</string>
              <string>Noto Sans CJK SC</string>
              <string>Noto Sans</string>
              <string>Twemoji</string>
            </edit>
          </match>

          <!-- Default serif fonts-->
          <match target="pattern">
            <test name="family">
              <string>serif</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Caskaydia Cove NF</string>
              <string>Noto Serif CJK SC</string>
              <string>Noto Serif</string>
              <string>Twemoji</string>
            </edit>
          </match>

          <!-- Default monospace fonts-->
          <match target="pattern">
            <test name="family">
              <string>monospace</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>Caskaydia Cove NF</string>
              <string>Noto Sans Mono CJK SC</string>
              <string>Symbols Nerd Font</string>
              <string>Twemoji</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-HK</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-HK</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <!-- not have HK -->
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-HK</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-TW</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-TW</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>zh-TW</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ja</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
                <string>ja</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ja</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ko</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ko</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang">
              <string>ko</string>
            </test>
            <test name="family">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <!-- Replace monospace fonts -->
          <match target="pattern">
            <test name="family" compare="contains">
              <string>Source Code</string>
            </test>
            <edit name="family" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>
          <match target="pattern">
            <test name="lang" compare="contains">
              <string>en</string>
            </test>
            <test name="family" compare="contains">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>

          <match target="pattern">
            <test name="lang" compare="contains">
              <string>en</string>
            </test>
            <test name="family" compare="contains">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>
        </fontconfig>
        
        <match target="pattern">
            <test name="lang" compare="contains">
              <string>de</string>
            </test>
            <test name="family" compare="contains">
              <string>${settings.used-font}</string>
            </test>
            <edit name="family" mode="prepend" binding="strong">
              <string>${settings.used-font}</string>
            </edit>
          </match>
        </fontconfig>
      '';
    };
  };

}
