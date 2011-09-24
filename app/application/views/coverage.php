<h1>Code Coverage</h1>
<p>Generating code coverage reports for in browser testing (or manual testing) is usually difficult to achieve.  It can be accomplished by using tools like PHPCoverage.  Using this tool, it is possible to reversibly instrument the main entry point for your application and capture code coverage statistics for the duration of a test.  The results are dumped to the local file system and can be made available through the web server or through a file system mount.</p>

<h2>Example</h2>

<p>To run these examples from your local machine:</p>

<pre class="brush: bash">
$ rake coverage
</pre>

<p>Results can be inspected by visiting: <a href="/phpcoverage/generateReport.php">Code Coverage Report</a></p>

<h3>Pros</h3>
<ul>
<li>Can get data about code coverage of in browser tests</li>
<li>Can also capture code coverage of manual tests</li>
<li>May help expose dead code</li>
</ul>


<h3>Cons</h3>
<ul>
<li>Memory Intensive</li>
<li>Won't provide coverage for backend processes or code that is triggered without going through the main entry point.</li>
</ul>

<p>Warning: Make sure you don't deploy any of the code required to generate code coverage reports to your production servers.</p>