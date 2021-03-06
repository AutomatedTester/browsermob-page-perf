package com.browsermob.pageperf;

import org.openqa.selenium.firefox.FirefoxBinary;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

import java.io.File;
import java.io.IOException;
import java.util.Dictionary;

public class PagePerfFirefoxDriver extends FirefoxDriver {
    private String testId;
    private String pagePerfServer;

    public PagePerfFirefoxDriver(String testId, String pagePerfServer) {
        this(testId, pagePerfServer, null);
    }

    public PagePerfFirefoxDriver(String testId, String pagePerfServer, FirefoxBinary binary) {
        super(binary, tweakProfile(new FirefoxProfile()));
        this.testId = testId;
        this.pagePerfServer = pagePerfServer;
    }

    public PagePerfFirefoxDriver(FirefoxProfile profile) {
        super(tweakProfile(profile));
    }

    private static FirefoxProfile tweakProfile(FirefoxProfile profile) {
        try {
            profile.addExtension(FirefoxProfile.class, "firebug-1.6X.0a7.xpi");
            profile.addExtension(FirefoxProfile.class, "netExport-0.7b13-mob.xpi");
            profile.addExtension(FirefoxProfile.class, "yslow-2.0.7-fx.xpi");
            profile.addExtension(FirefoxProfile.class, "fireStarter-0.1.a5.xpi");
        } catch (IOException e) {
            throw new RuntimeException("Could not load required extensions, something is worng", e);
        }

        profile.setPreference("extensions.firebug.netexport.autoExportActive", true);
        //profile.setPreference("extensions.firebug.netexport.defaultLogDir", dir.getAbsolutePath());
        profile.setPreference("extensions.firebug.DBG_NETEXPORT", true);
        profile.setPreference("extensions.firebug.onByDefault", true);
        profile.setPreference("extensions.firebug.defaultPanelName", "net");
        profile.setPreference("extensions.firebug.net.enableSites", true);
        profile.setPreference("extensions.firebug.previousPlacement", 1);

        return profile;
    }

    public void process(String pageId){
        Reporter.process(testId, pageId, pagePerfServer, getLogDir());
    }

    public Dictionary<String,Object> webTimingsForPage(){
        Dictionary<String,Object> webTiming = (Dictionary<String, Object>) executeScript("var performance = window.performance || window.webkitPerformance || window.mozPerformance || window.msPerformance || {};"
                                + "var timings = performance.timing || {};"
                                + "return timings;");
        return webTiming;
    }

    @Override
    public void close() {
        // go to example.com to force the page unload
        get("http://example.com");

        // chill for a sec
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        // go ahead and close it
        super.close();

        File logDir = getLogDir();
        Reporter.process(testId,"", pagePerfServer, logDir);
    }

    private File getLogDir() {
        File logDir = new File(profile.getProfileDir(), "firebug/netexport/logs");
        return logDir;
    }
}
