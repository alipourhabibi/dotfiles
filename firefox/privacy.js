// Shared by firefox + zen (init.sh appends it to each user.js).

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
user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.fingerprintingProtection", true);

// --- Network: ignore system proxy (hiddify leaves it set when off); FoxyProxy handles proxies ---
user_pref("network.proxy.type", 0);
