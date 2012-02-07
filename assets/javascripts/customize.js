window.bootstrapLess = document.getElementById('bootstrap-less').innerHTML;

$(function() {
  $("input.variable").change(function() {
    var oldVariable, newVariable, newStyle = bootstrapLess;

    $("input.variable").each(function() {
      if($(this).val() != "") {
        oldVariable = new RegExp("@" + $(this).attr('name') + ":\s*.+;");
        newVariable = "@" + $(this).attr('name') + ": " + $(this).val() + ";";
        newStyle = newStyle.replace(oldVariable, newVariable);
      }
    });

    if($(this).hasClass("variable-color")) {
      var color = $(this).val() || $(this).attr("placeholder");
      $(this).parent().next().find("span.swatch").css("background-color", color);
    }

    // reload style
    $("head").append($("<style type='text/less'>" + newStyle + "</style>"));
    less.refreshStyles();

    // update variables code
    var variablesStyle = newStyle.replace(/^\s*/g, '');
    
    console.log(variablesStyle);
    
    variablesStyle = variablesStyle.substring(variablesStyle.search(/\/\/ Variables\.less/));
    variablesStyle = variablesStyle.substring(-(variablesStyle.search(/^\s*@import \"assets\/stylesheets\/mixins/)));

    $("#variables").html(variablesStyle);

    // make code pretty
    window.prettyPrint && prettyPrint();
  });

  // make code pretty
  window.prettyPrint && prettyPrint();
});
