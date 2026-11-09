// Firefox setup. Applied on every start.
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

// --- New tab: no ads, no stories ---
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("extensions.pocket.enabled", false);

// --- Privacy / telemetry ---
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("dom.private-attribution.submission.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);
