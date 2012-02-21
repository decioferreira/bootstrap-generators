window.bootstrapLess = document.getElementById('bootstrap-less').innerHTML;
window.styleHasChanged = false;

function lessVariableToScss(lessVar) {
  var scssVar = lessVar.replace(new RegExp("spin\\("), "adjust-hue(");
  scssVar = scssVar.replace(new RegExp("\@"), "\$");
  return scssVar;
}

$(function() {
  window.bootstrapScss = $('#scss-variables').html();

  $("input.variable").change(function() {
    var oldVariable, newVariable, newLessStyle = bootstrapLess, newScssStyle = bootstrapScss;

    // Flag change
    window.styleHasChanged = true;

    $("input.variable").each(function() {
      if($(this).val() != "") {
        // LESS
        oldVariable = new RegExp("@" + $(this).attr('name') + ":( *).+;");
        newVariable = "@" + $(this).attr('name') + ":$1" + $(this).val() + ";";
        newLessStyle = newLessStyle.replace(oldVariable, newVariable);
        newLessStyle = newLessStyle.replace(new RegExp("./assets/images/", "g"), "");

        // SCSS
        oldVariable = new RegExp("\\$" + $(this).attr('name') + ":( *).+!default;");
        newVariable = "$" + $(this).attr('name') + ":$1" + lessVariableToScss($(this).val()) + " !default;";
        newScssStyle = newScssStyle.replace(oldVariable, newVariable);
      }
    });

    // reload style
    $("head").append($("<style type='text/less'>" + newLessStyle + "</style>"));
    less.refreshStyles();

    // update LESS variables code
    var lessVariablesStyle = newLessStyle.replace(/^ +/gm, '');
    lessVariablesStyle = lessVariablesStyle.substring(lessVariablesStyle.search(/\/\/ Variables\.less/) - 1);
    lessVariablesStyle = lessVariablesStyle.substring(0, lessVariablesStyle.search(/@import \"assets\/stylesheets\/mixins/));
    lessVariablesStyle = lessVariablesStyle.trim();

    $("#less-variables").html(lessVariablesStyle);

    // update SCSS variables code
    $("#scss-variables").html(newScssStyle);

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
      return "";
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
