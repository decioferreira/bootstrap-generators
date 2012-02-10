window.bootstrapLess = document.getElementById('bootstrap-less').innerHTML;
window.styleHasChanged = false;

$(function() {
  $("input.variable").change(function() {
    var oldVariable, newVariable, newStyle = bootstrapLess;

    // Flag change
    window.styleHasChanged = true;

    $("input.variable").each(function() {
      if($(this).val() != "") {
        oldVariable = new RegExp("@" + $(this).attr('name') + ":\s*.+;");
        newVariable = "@" + $(this).attr('name') + ": " + $(this).val() + ";";
        newStyle = newStyle.replace(oldVariable, newVariable);
      }
    });

    // reload style
    $("head").append($("<style type='text/less'>" + newStyle + "</style>"));
    less.refreshStyles();

    // update variables code
    var variablesStyle = newStyle.replace(/^ +/gm, '');
    variablesStyle = variablesStyle.substring(variablesStyle.search(/\/\/ Variables\.less/) - 1);
    variablesStyle = variablesStyle.substring(0, variablesStyle.search(/@import \"assets\/stylesheets\/mixins/));
    variablesStyle = variablesStyle.trim();

    $("#variables").html(variablesStyle);

    // make code pretty
    window.prettyPrint && prettyPrint();
  });

  // Disable certain links in docs
  $('section a[href=#]').click(function (e) {
    e.preventDefault();
  });

  // Helper tooltip
  $("input.variable-color").tooltip({
    placement: 'top',
    title: function() {
      if(!styleHasChanged) {
        var color = ( $(this).attr("placeholder") == '#08c' || $(this).attr("placeholder") == '@linkColor' ? '#F30' : '#08C' );
        return "Type down <strong>" + color + "</strong> and click outside the input tag!";
      }
    },
    trigger: 'focus'
  });


  // Start here link
  $("#start-here").click(function() {
    $("input[name=navbarBackground]").focus();
  });

  // make code pretty
  window.prettyPrint && prettyPrint();
});
