<h1>In Browser Testing</h1>

<p>It is possible to automate browser based tests by using existing tools, such as Watir or Selenium, and simply run them against an existing php web application.  Because these tests interact with the Web site through a browser, they are agnostic about the language used to implement the Web site.</p>

<hr />
<h2>Examples</h2>
<ul>
    <li><a href="/code/features/blog.feature">Blog Features</a></li>
    <li><a href="/code/features/step_definitions/browser_steps.rb">Step Definitions</a></li>
</ul>

<hr />
<p>To execute these tests</p>
<pre class="brush: bash">
$ rake browser
</pre>
<hr />

<h2>Pros</h2>
<ul>
    <li>Good representation of user experience</li>
    <li>Supports javascript</li>
    <li>Can be integrated into builds</li>
</ul>
    
<h2>Cons</h2>
<ul>
    <li>Slow</li>
    <li>Brittle</li>
    <li>Can only interact through web UI</li>
</ul>

<hr />
<h3>Links</h3>
<ul>
  <li><a href="/blog">Blog index</a></li>
  <li><a href="/blog/new">Create new blog entry</a>
</ul>

