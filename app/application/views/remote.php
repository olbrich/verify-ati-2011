<h1>Remote Instrumentation with Cuke4php</h1>
    <p>At times, it is helpful to be able to interact directly with backend code on a server being tested using Selenium or Watir.</p>
    <h2>How does it work?</h2>
    <ul>
        <li>Cucumber process on local machine asks remote machine about step definitions it doesn't understand</li>
        <li>cuke4php_server listener on remote machine on a given port will attempt to handle unknown steps</li>
    </ul>

    <h2>Why?</h2>
    <ul>
        <li>Create/destroy objects when no UI is available</li>
        <li>Setup/teardown of server state</li>
        <li>Alter configs</li>
        <li>Create/destroy accounts (avoid CAPTCHAs)</li>
        <li>Trigger events behind the scenes</li>
    </ul>
    
    <h2>Caveats</h2>
    <ul>
        <li>Concurrency of tests can be tricky</li>
        <li>Concurrent use by humans can be a problem</li>
        <li>Need to restart cuke4php_server to pick up changes to step_definitions</li>
    </ul>
    
<hr />
<h3>Links</h3>
<ul>
    <li><a href="http://vagrant:vagrant@localhost:3737/" target="monit">Monit - Monitor remote cuke4php_server instance</a></li>
</ul>