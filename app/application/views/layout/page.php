<html>
  <head>
    <title><?php echo $title?></title>
    <link rel="stylesheet" href="/static/main.css" type="text/css" media="screen" title="main" charset="utf-8">
  </head>
  <body>
    <div id="nav">
        <ul>
            <li><?php echo HTML::anchor('/','Home') ?></li>
            <?php 
                if (isset($links)) {
                foreach ($links as $link) {
                echo "<li><a href=\"{$link[0]}\">{$link[1]}</a></li>";
            }}?>
        </ul>
    </div>
    <div id="main">
        <?php echo $body ?>
    </div>
  </body>
  <link href='/static/shCore.css' rel='stylesheet' type='text/css' /> 
  <link href='/static/shThemeDefault.css' rel='stylesheet' type='text/css' /> 
  <script src='/static/shCore.js' type='text/javascript'></script>
  <script src='/static/shBrushRuby.js' type='text/javascript'></script>
  <script src='/static/shBrushPhp.js' type='text/javascript'></script>
  <script src='/static/shBrushGherkin.js' type='text/javascript'></script>
  <script src='/static/shBrushYaml.js' type='text/javascript'></script>
  <script src='/static/shBrushBash.js' type='text/javascript'></script>
  <script type="text/javascript" charset="utf-8">
    SyntaxHighlighter.all()
  </script>
</html>
