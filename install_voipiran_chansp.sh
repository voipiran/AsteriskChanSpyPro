#!/bin/bash

clear
# Colorize output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m' # No color
echo -e "${MAGENTA}###############################################################${NC}"
echo -e "${CYAN}██╗   ██╗ ██████╗ ██╗██████╗ ██╗██████╗  █████╗ ███╗   ██╗${NC}"
echo -e "${CYAN}██║   ██║██╔═══██╗██║██╔══██╗██║██╔══██╗██╔══██╗████╗  ██║${NC}"
echo -e "${CYAN}██║   ██║██║   ██║██║██████╔╝██║██████╔╝███████║██╔██╗ ██║${NC}"
echo -e "${CYAN}╚██╗ ██╔╝██║   ██║██║██╔═══╝ ██║██╔══██╗██╔══██║██║╚██╗██║${NC}"
echo -e "${CYAN} ╚████╔╝ ╚██████╔╝██║██║     ██║██║  ██║██║  ██║██║ ╚████║${NC}"
echo -e "${CYAN}  ╚═══╝   ╚═════╝ ╚═╝╚═╝     ╚═╝╚══╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝${NC}"
echo -e "${MAGENTA}###############################################################${NC}"
echo -e "${MAGENTA}                    https://voipiran.io                    ${NC}"
echo -e "${MAGENTA}###############################################################${NC}"

echo "Install VOIPIRAN ChanSpy Pro"
echo "VOIPIRAN.io"
echo "VOIPIRAN ChanSpy 1.0"
sleep 1

rootpw=$(sed -ne 's/.*mysqlrootpwd=//gp' /etc/issabel.conf)


####Install Source Gaurdian Files
echo "------------START-----------------"
# Get PHP version
php_version=$(php -r "echo PHP_MAJOR_VERSION;")


###Add from-internal-custom
# File to check, There is no from-internal-custom on Issabel5
FILE="/etc/asterisk/extensions_custom.conf"
LINE="[from-internal-custom]"
if ! grep -qF "$LINE" "$FILE"; then
    #echo "The line '$LINE' does not exist in the file '$FILE'. Adding the line."
    echo "$LINE" | sudo tee -a "$FILE"
fi



# Ensure include line exists directly after [from-internal-custom]
if grep -qF "include => voipiran-chanspypro" "$FILE"; then
  echo -e "${GREEN}include => voipiran-chanspypro already exists${NC}"
else
  echo -e "${YELLOW}Adding include => voipiran-chanspypro after [from-internal-custom]${NC}"
  sudo sed -i '/\[from-internal-custom\]/a include => voipiran-chanspypro' "$FILE"
fi

# Add dialplan block at end if not already present
if grep -qF "[voipiran-chanspypro]" "$FILE"; then
  echo -e "${GREEN}[voipiran-chanspypro] context already exists${NC}"
else
  echo -e "${YELLOW}Adding voipiran-chanspypro context to end of file${NC}"
  cat <<'EOD' | sudo tee -a "$FILE" >/dev/null

[voipiran-chanspypro]
;; ChanSpy
exten => _30X.,1,ChanSpy(SIP/${EXTEN:2},Eq)
;; Only listen to audio coming from this channel.
exten => _31X.,1,ChanSpy(SIP/${EXTEN:2},Eqo)
;; Enable whisper mode, so the spying channel can talk to the spied-on channel.
exten => _32X.,1,ChanSpy(SIP/${EXTEN:2},Eqw)
;; Enable private whisper mode, so the spying channel can talk to the spied-on channel but cannot listen to that channel.
exten => _33X.,1,ChanSpy(SIP/${EXTEN:2},EqW)
;; Instead of whispering on a single channel barge in on both channels involved in the call.
;; Conference
exten => _34X.,1,ChanSpy(SIP/${EXTEN:2},EqB)

EOD
fi



# شنود ساده
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-Simple','VOIZ-شنود ساده، کد + داخلی','*30',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*30'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1

# شنود صدای کارشناس فقط
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-OnlyListen','VOIZ-فقط صدای کارشناس، کد + داخلی','*31',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*31'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1

# شنود و نجوا (Whisper)
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-Whisper','VOIZ-شنود و صحبت پنهانی، کد + داخلی','*32',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*32'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1

# نجوا خصوصی (Private Whisper)
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-PrivateWhisper','VOIZ-صحبت با کارشناس بدون شنیدن مشتری، کد + داخلی','*33',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*33'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1

# شنود و ورود به مکالمه (Barge)
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-Barge','VOIZ-شنود و مکالمه با هر دو طرف، کد + داخلی','*34',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*34'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1

# شنود با تغییر حالت در حین تماس (DTMF)
query="insert into featurecodes (modulename,featurename,description,defaultcode,customcode,enabled,providedest) \
VALUES('core','ChanSpy-DTMF','VOIZ-تغییر حالت شنود حین تماس با کلید 4/5/6، کد + داخلی','*35',NULL,'1','1') \
ON DUPLICATE KEY UPDATE defaultcode='*35'"
mysql -hlocalhost -uroot -p$rootpw asterisk -e "$query" >/dev/null 2>&1




# Reload Asterisk
echo -e "${CYAN}Reloading Asterisk...${NC}"
sudo asterisk -rx "dialplan reload"
echo -e "${GREEN}Installation completed successfully!${NC}"

