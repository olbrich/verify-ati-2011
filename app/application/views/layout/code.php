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
<pre class="brush: <?php $path = pathinfo($title); echo $path['extension']; ?>">
<?php echo $body ?>
</pre>
    </div>
  </body>
  <link href='/static/shCore.css' rel='stylesheet' type='text/css' /> 
  <link href='/static/shThemeDefault.css' rel='stylesheet' type='text/css' /> 
  <script src='/static/shCore.js' type='text/javascript'></script>
  <script src='/static/shBrushRuby.js' type='text/javascript'></script>
  <script src='/static/shBrushPhp.js' type='text/javascript'></script>
  <script src='/static/shBrushGherkin.js' type='text/javascript'></script>
  <script src='/static/shBrushYaml.js' type='text/javascript'></script>
  <script type="text/javascript" charset="utf-8">
    SyntaxHighlighter.all()
  </script>
</html>
