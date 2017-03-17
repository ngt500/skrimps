# remove old  output
rm -f sechecklist.txt

# DISABLE IPV6
networksetup -listallnetworkservices >> sechecklist.txt
echo "Wi-Fi settings:" >> sechecklist.txt
sudo networksetup -setv6off "Wi-Fi" >> sechecklist.txt
networksetup -getinfo "Wi-Fi" >> sechecklist.txt
echo "Thunderbolt Ethernet settings:" >> sechecklist.txt
sudo networksetup -setv6off "Thunderbolt Ethernet" >> sechecklist.txt
networksetup -getinfo "Thunderbolt Ethernet" >> sechecklist.txt

# FIREWALL ENABLED SYSTEMWIDE
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on >> sechecklist.txt
echo -n "Firewall Enabled: " >> sechecklist.txt
defaults -currentHost read /Library/Preferences/com.apple.alf globalstate >> sechecklist.txt

# FIREWALL LOGGING ENABLED
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on >> sechecklist.txt
echo -n "Firewall Logging Enabled: " >> sechecklist.txt
defaults -currentHost read /Library/Preferences/com.apple.alf loggingenabled >> sechecklist.txt


# FIREWALL STEALTH MODE
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true >> sechecklist.txt
echo -n "Firewall Stealth Mode Enabled: " >> sechecklist.txt
defaults -currentHost read /Library/Preferences/com.apple.alf stealthenabled >> sechecklist.txt

# CAPTIVE PORTAL
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# APPLE REMOTE EVENTS
sudo systemsetup -setremoteappleevents off >> sechecklist.txt
echo -n "Remote Apple Events: " >> sechecklist.txt
sudo systemsetup -getremoteappleevents >> sechecklist.txt

# APPLE REMOTE LOGIN
sudo systemsetup -f -setremotelogin off >> sechecklist.txt
echo -n "Remote Login: " >> sechecklist.txt
sudo systemsetup -getremotelogin >> sechecklist.txt

# BLUETOOTH
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0; sudo killall -HUP blued >> sechecklist.txt
echo -n "Bluetooth ControllerPowerState: " >> sechecklist.txt
defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState >> sechecklist.txt

# IR
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0 >> sechecklist.txt
echo -n "Infrared reciever: " >> sechecklist.txt
defaults read /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled >> sechecklist.txt
# METADATA
echo "# Prevent osx from writing metadata" >> sechecklist.txt
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true >> sechecklist.txt
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true >> sechecklist.txt
defaults read com.apple.desktopservices >> sechecklist.txt

# PMSET
echo "# Destroy FileVault keys on standby" >> sechecklist.txt
sudo pmset destroyfvkeyonstandby 1 >> sechecklist.txt
pmset -g live | grep "DestroyFVKeyOnStandby" >> sechecklist.txt

# SAFARI READ PREFS BEFORE
echo "## Safari settings before" >> sechecklist.txt
echo -n "AlwaysRestoreSessionAtLaunch: " >> sechecklist.txt
defaults read com.apple.safari AlwaysRestoreSessionAtLaunch >> sechecklist.txt
echo -n "AlwaysShowTabBar: " >> sechecklist.txt
defaults read com.apple.safari AlwaysShowTabBar >> sechecklist.txt
echo -n "AutoFillCreditCardData: " >> sechecklist.txt
defaults read com.apple.safari AutoFillCreditCardData >> sechecklist.txt
echo -n "AutoFillFromAddressBook: " >> sechecklist.txt
defaults read com.apple.safari AutoFillFromAddressBook >> sechecklist.txt
echo -n "AutoFillMiscellaneousForms: " >> sechecklist.txt
defaults read com.apple.safari AutoFillMiscellaneousForms >> sechecklist.txt
echo -n "AutoFillPasswords: " >> sechecklist.txt
defaults read com.apple.safari AutoFillPasswords >> sechecklist.txt
echo -n "AutoOpenSafeDownloads: " >> sechecklist.txt
defaults read com.apple.safari AutoOpenSafeDownloads >> sechecklist.txt
echo -n "CanPromptForPushNotifications: " >> sechecklist.txt
defaults read com.apple.safari CanPromptForPushNotifications >> sechecklist.txt
echo -n "ClearBrowsingDataLastIntervalUsed: " >> sechecklist.txt
defaults read com.apple.safari ClearBrowsingDataLastIntervalUsed >> sechecklist.txt
echo -n "DefaultBrowserPromptingState2: " >> sechecklist.txt
defaults read com.apple.safari DefaultBrowserPromptingState2 >> sechecklist.txt
echo -n "DownloadsClearingPolicy: " >> sechecklist.txt
defaults read com.apple.safari DownloadsClearingPolicy >> sechecklist.txt
echo -n "HistoryAgeInDaysLimit: " >> sechecklist.txt
defaults read com.apple.safari HistoryAgeInDaysLimit >> sechecklist.txt
echo -n "IncludeDevelopMenu: " >> sechecklist.txt
defaults read com.apple.safari IncludeDevelopMenu >> sechecklist.txt
echo -n "OpenPrivateWindowWhenNotRestoringSessionAtLaunch: " >> sechecklist.txt
defaults read com.apple.safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch >> sechecklist.txt
echo -n "NewTabBehavior: " >> sechecklist.txt
defaults read com.apple.safari NewTabBehavior >> sechecklist.txt
echo -n "NewWindowBehavior: " >> sechecklist.txt
defaults read com.apple.safari NewWindowBehavior >> sechecklist.txt
echo -n "SendDoNotTrackHTTPHeader: " >> sechecklist.txt
defaults read com.apple.safari SendDoNotTrackHTTPHeader >> sechecklist.txt
echo -n "ShowFrequentlyVisitedSites: " >> sechecklist.txt
defaults read com.apple.safari ShowFrequentlyVisitedSites >> sechecklist.txt
echo -n "ShowFullURLInSmartSearchField: " >> sechecklist.txt
defaults read com.apple.safari ShowFullURLInSmartSearchField >> sechecklist.txt
echo -n "ShowOverlayStatusBar: " >> sechecklist.txt
defaults read com.apple.safari ShowOverlayStatusBar >> sechecklist.txt
echo -n "WarnAboutFraudulentWebsites: " >> sechecklist.txt
defaults read com.apple.safari WarnAboutFraudulentWebsites >> sechecklist.txt

defaults write com.apple.safari AlwaysRestoreSessionAtLaunch -bool false >> sechecklist.txt
defaults write com.apple.safari AlwaysShowTabBar -bool false >> sechecklist.txt
defaults write com.apple.safari AutoFillCreditCardData -bool false >> sechecklist.txt
defaults write com.apple.safari AutoFillFromAddressBook -bool false >> sechecklist.txt
defaults write com.apple.safari AutoFillMiscellaneousForms -bool false >> sechecklist.txt
defaults write com.apple.safari AutoFillPasswords -bool false >> sechecklist.txt
defaults write com.apple.safari AutoOpenSafeDownloads -bool false >> sechecklist.txt
defaults write com.apple.safari CanPromptForPushNotifications -bool false >> sechecklist.txt
defaults write com.apple.safari ClearBrowsingDataLastIntervalUsed -string "all history" >> sechecklist.txt
defaults write com.apple.safari DefaultBrowserPromptingState2 -int 4 >> sechecklist.txt
defaults write com.apple.safari DownloadsClearingPolicy -int 2 >> sechecklist.txt
defaults write com.apple.safari HistoryAgeInDaysLimit -int 1 >> sechecklist.txt
defaults write com.apple.safari IncludeDevelopMenu -bool true >> sechecklist.txt
defaults write com.apple.safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool true >> sechecklist.txt
defaults write com.apple.safari NewTabBehavior -int 1 >> sechecklist.txt
defaults write com.apple.safari NewWindowBehavior -int 1 >> sechecklist.txt
defaults write com.apple.safari SendDoNotTrackHTTPHeader -bool true >> sechecklist.txt
defaults write com.apple.safari ShowFrequentlyVisitedSites -bool true >> sechecklist.txt
defaults write com.apple.safari ShowFullURLInSmartSearchField -bool true >> sechecklist.txt
defaults write com.apple.safari ShowOverlayStatusBar -bool true >> sechecklist.txt
defaults write com.apple.safari WarnAboutFraudulentWebsites -bool false >> sechecklist.txt

echo "## Safari settings after" >> sechecklist.txt
echo -n "AlwaysRestoreSessionAtLaunch: " >> sechecklist.txt
defaults read com.apple.safari AlwaysRestoreSessionAtLaunch >> sechecklist.txt
echo -n "AlwaysShowTabBar: " >> sechecklist.txt
defaults read com.apple.safari AlwaysShowTabBar >> sechecklist.txt
echo -n "AutoFillCreditCardData: " >> sechecklist.txt
defaults read com.apple.safari AutoFillCreditCardData >> sechecklist.txt
echo -n "AutoFillFromAddressBook: " >> sechecklist.txt
defaults read com.apple.safari AutoFillFromAddressBook >> sechecklist.txt
echo -n "AutoFillMiscellaneousForms: " >> sechecklist.txt
defaults read com.apple.safari AutoFillMiscellaneousForms >> sechecklist.txt
echo -n "AutoFillPasswords: " >> sechecklist.txt
defaults read com.apple.safari AutoFillPasswords >> sechecklist.txt
echo -n "AutoOpenSafeDownloads: " >> sechecklist.txt
defaults read com.apple.safari AutoOpenSafeDownloads >> sechecklist.txt
echo -n "CanPromptForPushNotifications: " >> sechecklist.txt
defaults read com.apple.safari CanPromptForPushNotifications >> sechecklist.txt
echo -n "ClearBrowsingDataLastIntervalUsed: " >> sechecklist.txt
defaults read com.apple.safari ClearBrowsingDataLastIntervalUsed >> sechecklist.txt
echo -n "DefaultBrowserPromptingState2: " >> sechecklist.txt
defaults read com.apple.safari DefaultBrowserPromptingState2 >> sechecklist.txt
echo -n "DownloadsClearingPolicy: " >> sechecklist.txt
defaults read com.apple.safari DownloadsClearingPolicy >> sechecklist.txt
echo -n "HistoryAgeInDaysLimit: " >> sechecklist.txt
defaults read com.apple.safari HistoryAgeInDaysLimit >> sechecklist.txt
echo -n "IncludeDevelopMenu: " >> sechecklist.txt
defaults read com.apple.safari IncludeDevelopMenu >> sechecklist.txt
echo -n "OpenPrivateWindowWhenNotRestoringSessionAtLaunch: " >> sechecklist.txt
defaults read com.apple.safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch >> sechecklist.txt
echo -n "NewTabBehavior: " >> sechecklist.txt
defaults read com.apple.safari NewTabBehavior >> sechecklist.txt
echo -n "NewWindowBehavior: " >> sechecklist.txt
defaults read com.apple.safari NewWindowBehavior >> sechecklist.txt
echo -n "SendDoNotTrackHTTPHeader: " >> sechecklist.txt
defaults read com.apple.safari SendDoNotTrackHTTPHeader >> sechecklist.txt
echo -n "ShowFrequentlyVisitedSites: " >> sechecklist.txt
defaults read com.apple.safari ShowFrequentlyVisitedSites >> sechecklist.txt
echo -n "ShowFullURLInSmartSearchField: " >> sechecklist.txt
defaults read com.apple.safari ShowFullURLInSmartSearchField >> sechecklist.txt
echo -n "ShowOverlayStatusBar: " >> sechecklist.txt
defaults read com.apple.safari ShowOverlayStatusBar >> sechecklist.txt
echo -n "WarnAboutFraudulentWebsites: " >> sechecklist.txt
defaults read com.apple.safari WarnAboutFraudulentWebsites >> sechecklist.txt

defaults write com.apple.screencapture type jpg;killall SystemUIServer
open sechecklist.txt
