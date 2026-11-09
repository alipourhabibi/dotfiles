// Firefox setup. init.sh appends firefox/privacy.js to it.
// To undo one: delete the line here AND reset it in about:config.

// --- Tabs ---
user_pref("sidebar.revamp", true);
user_pref("sidebar.verticalTabs", true);
user_pref("browser.tabs.groups.enabled", true);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.tabs.unloadOnLowMemory", true);
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.tabmanager.enabled", true);
user_pref("browser.tabs.loadBookmarksInTabs", true);

// --- Toolbar / look ---
user_pref("browser.toolbars.bookmarks.visibility", "always");
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);
user_pref("extensions.activeThemeID", "firefox-compact-dark@mozilla.org");
user_pref("layout.css.prefers-color-scheme.content-override", 0);
