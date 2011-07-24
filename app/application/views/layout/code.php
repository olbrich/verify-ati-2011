<html>
  <head>
    <title><?php echo $title?></title>
    <link rel="stylesheet" href="/static/main.css" type="text/css" media="screen" title="main" charset="utf-8">
  </head>
  <body>
    <div id="nav">
        <ul>
            <li><?php echo HTML::anchor('/','Home') ?></li>
            <li><a href="javascript: history.go(-1)">Back</a></li>
        </ul>
    </div>
    <div id="main">
<h1><?php echo $title ?></h1>
<pre><code>
<?php echo $body ?>
</code></pre>
    </div>
  </body>
</html>
