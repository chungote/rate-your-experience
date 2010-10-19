<g:isLoggedIn>
<g:ifAnyGranted role="ROLE_ADMIN,ROLE_AGENT,ROLE_BROKER">
  <div id="todo">
    <div id="reminders">
      <ul>
        <li></li>
        <li></li>
        <li></li>
      </ul>
    </div>

    <script type="text/javascript">
      YAHOO.util.Connect.asyncRequest('POST', '/RateYourExperience/todo/reminders', {success: function(o) {
        YAHOO.util.Dom.get('reminders').innerHTML = o.responseText;
      }})
    </script>
  </div>
  </g:ifAnyGranted>
</g:isLoggedIn>
