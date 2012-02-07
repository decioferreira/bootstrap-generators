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

    $("head").append($("<style type='text/less'>" + newStyle + "</style>"));
    less.refreshStyles();
  });

  // make code pretty
  window.prettyPrint && prettyPrint()
});
