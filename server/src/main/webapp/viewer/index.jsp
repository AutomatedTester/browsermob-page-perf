<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTTP Archive Viewer 1.1-8</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<script type="text/javascript" src="schema.js" preserve="true" xml:space="preserve"></script>
<link rel="StyleSheet" href="har.css" type="text/css">
<script type="text/javascript" src="har.js"></script>
<!--[if IE]><script type="text/javascript" src="excanvas/excanvas.compiled.js"></script><![endif]-->
</head>
<body>
<div id="content" version="1.1-8" ondragenter="HAR.Lib.cancelEvent(event);" ondragover="HAR.Lib.cancelEvent(event);" ondrop="HAR.Tab.InputView.onDrop(event);"></div>
<div id="InputTabTemplate" style="display:none">
<ul style="padding-left: 20px; line-height: 20px; margin-top: 0px">
<li>Paste <a href="http://groups.google.com/group/firebug-working-group/web/http-tracing---export-format" shape="rect">HAR</a>
log into the text box below and
press the <b>Preview</b> button.</li>
<li>Or drop <span class="red">*.har</span> file(s) anywhere on the page (you need Firefox 3.6).</li>
</ul>
<table cellpadding="0" cellspacing="4">
<tr>
<td rowspan="1" colspan="1"><input type="checkbox" id="validate" checked="true" onchange="HAR.Viewer.onValidationChange()"></td><td style="vertical-align:middle;padding-bottom: 1px;" rowspan="1" colspan="1">Validate data before processing?</td>
</tr>
</table>
<textarea id="sourceEditor" class="sourceEditor" cols="80" rows="5"></textarea>
<p>
<table cellpadding="0" cellspacing="0">
<tr>
<td rowspan="1" colspan="1"><button id="appendPreview" onclick="HAR.Tab.InputView.onAppendPreview();" type="submit">Preview</button></td>
</tr>
</table>
</p><br/><h3>HAR Log Examples</h3>
<ul style="line-height:20px;">
<li>
<span class="link" onclick="HAR.Viewer.loadExample('examples/inline-scripts-block.har');">
Inline scripts block</span> - Inline scripts block the page load.</li>
<li>
<span class="link" onclick="HAR.Viewer.loadExample('examples/browser-blocking-time.har');">
Blocking time</span> - Impact of a limit of max number of parallel connections.</li>
<li>
<span class="link" onclick="HAR.Viewer.loadExample('examples/softwareishard.com.har');">
Browser cache</span> - Impact of the browser cache on page load (the same page loaded three times).</li>
<li>
<span class="link" onclick="HAR.Viewer.loadExample('examples/google.com.har');">
Single page</span> - Single page load (empty cache).</li>
</ul><br/><p>
<i>This viewer supports HAR 1.1 (see the <span class="link" onclick="HAR.Tab.InputView.onAbout()">About</span> tab).<br/></i>
</p>
</div>
<div id="HelpTabTemplate" style="display:none">
<h2>HTTP Archive Viewer 1.1-8</h2>
<i>Author: Jan Odvarko, odvarko@gmail.com</i><br/><br/><table style="width:600px;">
<tr>
<td rowspan="1" colspan="1">
<p>The purpose of this online tool is to visualize
<a href="http://groups.google.com/group/firebug-working-group/web/http-tracing---export-format" shape="rect">
    HTTP Archive 1.1</a>
log files (JSON) created by HTTP tracking tools. These files contain log of HTTP
client/server conversation and can be used for an additional analysis of e.g. 
page load performance.</p>
<p>User interface of this tool is composed from the following tabs:</p>
<ul>
<li>
<b>Home</b> - Paste content of a log file into the text box in this tab.</li>
<li>
<b>Preview</b> - Switch to this tab if you want to see visualised HTTP traffic.</li>
<li>
<b>HAR</b> - Use this tab to see structure of the input JSON data as an expandable tree.</li>
<li>
<b>Schema</b> - Explore format of the input log in this tab.</li>
</ul>
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>Discussion Group</h3>
<p>Feedback: <a href="http://groups.google.com/group/http-archive-specification" shape="rect">
    http://groups.google.com/group/http-archive-specification</a>
</p>
<p>Report issue: <a href="http://code.google.com/p/harviewer/issues/list" shape="rect">
    http://code.google.com/p/harviewer/issues/list</a>
</p>
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>Create Logs using Firebug 1.5</h3>
One of the tools you can use to log data transfered over HTTP protocol
is <b>Firebug</b>. To do this you have to also install Firebug extension
called <b>NetExport.</b>
<p>Recommended configurations:</p>
<ul>
<li>
<a href="http://getfirebug.com/releases/firebug/1.5/" shape="rect">
        Firebug 1.5</a> +
    <a href="http://getfirebug.com/releases/netexport/" shape="rect">NetExport 0.7</a>
    (supports 
    <a href="http://groups.google.com/group/firebug-working-group/web/http-tracing---export-format" shape="rect">
    HAR Spec 1.1</a>) 
    </li>
</ul>
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>HTTP Archive Specification</h3>
<p>Required
<a href="http://groups.google.com/group/firebug-working-group/web/http-tracing---export-format" shape="rect">
structure</a> of the input HTTP Archive file (*.har) is described using
<a href="http://www.json.com/json-schema-proposal/" shape="rect">JSON Schema</a>.
You can explore the current schema definition within the <b>Shema</b>
tab on this page.</p>
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>Request Timing Fields</h3>
<p>Part of the HTTP log is also a timing info about network request executions.
Here is a description of individual request/response phases:</p>
<ul>
<li>
<i>Blocking</i> - Time spent in a queue waiting for a network connection.</li>
<li>
<i>DNS Lookup</i> - DNS resolution time. The time required to resolve a host name.</li>
<li>
<i>Connecting</i> - Time required to create TCP connection.</li>
<li>
<i>Sending</i> - Time required to send HTTP request to the server.</li>
<li>
<i>Waiting</i> - Waiting for a response from the server.</li>
<li>
<i>Receiving</i> - Time required to read entire response from the server (or cache).</li>
</ul>
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>Online Log Files</h3>
<p>HAR Viewer also support JSONP and so it's possible to load log files 
from differet domains. This allows to link your online logs and preview them
automaticaly within the viewer.</p>
<p>
<i>1. The Content of a *.har file must be enclosed within a callback function:</i>
</p>
<code>onInputData({ "log": { ... } })</code>
<p>
<i>2. The link displaying a *.har file (using this viewer) must specify URL of
the file in <b>inputUrl</b> parameter:</i>
</p>
<code>http://www.softwareishard.com/har/viewer/?inputUrl=http://www.example.com/netData.har</code>
<p>
<i>3. A custom name of the callback function can be specified in a <b>callback</b> parameter
(by default it's <b>onInputData</b>):</i>
</p>
<code>http://www.softwareishard.com/har/viewer/?inputUrl=http://www.example.com/netData.har&amp;callback=onInputData</code><br/><br/></td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<h3>Previous Viewers</h3>
<p>Old logs created using HAR spec 1.0 (deprecated) can be previewed
<a href="http://www.softwareishard.com/har/viewer-1.0/" shape="rect">here</a>.</p>
</td>
</tr>
</table>
</div>
<script type="text/javascript" xml:space="preserve">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-3586722-1']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script');
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 
        'http://www') + '.google-analytics.com/ga.js';
    ga.setAttribute('async', 'true');
    document.documentElement.firstChild.appendChild(ga);
})();
</script>
</body>
</html>
